//
//  MovieDetailsViewModel.swift
//  iMovies
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import Combine
import Foundation
import MoviesDomain
import Stinsen
import SwiftUI

final class MovieDetailsViewModel: LoadableObject {
    @Published var state: ViewState<MovieDetailsModel> = .loading

    @RouterObject
    var router: MovieDetailsCoordinator.Router?

    var movieId: Int
    var movieDetails: MoviesDetailsResponse?

    @Published var isInWishlist: Bool = false

    var viewDidLoad: PassthroughSubject<Void, Never> = .init()
    var wishlist: PassthroughSubject<Void, Never> = .init()
    private var cancellables = Set<AnyCancellable>()

    let movieDetailsUseCase: any GetDetailsUseCaseProtocol
    let reviewsUseCase: any GetReviewsUseCaseProtocol
    let castUseCase: any GetCastUseCaseProtocol

    let isInWishListUseCase: any IsInWishListUseCaseProtocol
    let addToWishListUseCase: any AddToWishListUseCaseProtocol
    let removeFromWishlistUseCase: any RemoveFromWishListUseCaseProtocol

    init(movieId: Int,
         movieDetailsUseCase: any GetDetailsUseCaseProtocol,
         reviewsUseCase: any GetReviewsUseCaseProtocol,
         castUseCase: any GetCastUseCaseProtocol,
         isInWishListUseCase: any IsInWishListUseCaseProtocol,
         addToWishListUseCase: any AddToWishListUseCaseProtocol,
         removeFromWishlistUseCase: any RemoveFromWishListUseCaseProtocol) {
        self.movieId = movieId
        self.movieDetailsUseCase = movieDetailsUseCase
        self.reviewsUseCase = reviewsUseCase
        self.castUseCase = castUseCase

        self.isInWishListUseCase = isInWishListUseCase
        self.addToWishListUseCase = addToWishListUseCase
        self.removeFromWishlistUseCase = removeFromWishlistUseCase

        subscribeToViewDidLoad()
        subscribeToWishlist()
    }

    func load() {
        viewDidLoad.send()
    }

    func subscribeToViewDidLoad() {
        viewDidLoad
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                Task {
                    await self.getMovieDetails()
                }
            }
            .store(in: &cancellables)
    }

    func subscribeToWishlist() {
        wishlist
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                if isInWishlist {
                    Task {
                        await self.removeFromWishList()
                    }
                } else {
                    Task {
                        await self.addToWishlist()
                    }
                }
            }
            .store(in: &cancellables)
    }

    func getMovieDetails() async {
        await MainActor.run {
            state = .loading
        }

        async let movieDetails = await getDetails(id: movieId)
        async let reviewsDetails = await getReviews(id: movieId)
        async let castDetails = await getCast(id: movieId)

        let inWishList = await isInWishList()
        await MainActor.run {
            isInWishlist = inWishList
        }

        let deteailsViewModel: MovieDetailsModel = await .init(
            info: map(movieDetails: movieDetails),
            reviews: map(reviewsResponse: reviewsDetails),
            cast: map(castResponse: castDetails))

        await MainActor.run { [weak self] in
            self?.state = .loaded(deteailsViewModel)
        }
    }

    func isInWishList() async -> Bool {
        let input = IsInWishListUseCaseInput(movieId: movieId)
        return await isInWishListUseCase.execute(input)
    }

    func addToWishlist() async {
        let input = WishListItem(movieId: movieId,
                                 title: movieDetails?.title ?? "",
                                 voteAverage: movieDetails?.voteAverage ?? 0,
                                 genres: (movieDetails?.genres ?? []).map { $0.id ?? 0 },
                                 releaseDate: movieDetails?.releaseDate ?? "",
                                 poster: movieDetails?.posterPath ?? "")
        _ = await addToWishListUseCase.execute(input)
        await MainActor.run {
            isInWishlist = true
        }
    }

    func removeFromWishList() async {
        let input = RemoveFromWishListUseCaseInput(movieId: movieId)
        _ = await removeFromWishlistUseCase.execute(input)
        await MainActor.run {
            isInWishlist = false
        }
    }
}

extension Container {
    static func movieDetailsViewModel(movieId: Int) -> MovieDetailsViewModel {
        return MovieDetailsViewModel(movieId: movieId,
                                     movieDetailsUseCase: Container.getDetailsUseCase,
                                     reviewsUseCase: Container.getReviewsUseCase,
                                     castUseCase: Container.getCastUseCase,
                                     isInWishListUseCase: Container.isInWishlistUseCase,
                                     addToWishListUseCase: Container.addToWishlistUseCase,
                                     removeFromWishlistUseCase: Container.removeFromWishlistUseCase)
    }
}
