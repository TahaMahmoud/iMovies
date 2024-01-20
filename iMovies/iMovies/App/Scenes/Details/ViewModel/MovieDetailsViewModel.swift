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

    var viewDidLoad: PassthroughSubject<Void, Never> = .init()
    private var cancellables = Set<AnyCancellable>()

    let movieDetailsUseCase: any GetDetailsUseCaseProtocol
    let reviewsUseCase: any GetReviewsUseCaseProtocol
    let castUseCase: any GetCastUseCaseProtocol

    init(movieId: Int,
         movieDetailsUseCase: any GetDetailsUseCaseProtocol,
         reviewsUseCase: any GetReviewsUseCaseProtocol,
         castUseCase: any GetCastUseCaseProtocol) {
        self.movieId = movieId
        self.movieDetailsUseCase = movieDetailsUseCase
        self.reviewsUseCase = reviewsUseCase
        self.castUseCase = castUseCase

        subscribeToViewDidLoad()
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

    func subscribeToReload() {
    }

    func getMovieDetails() async {
        await MainActor.run {
            state = .loading
        }

        async let movieDetails = await getDetails(id: movieId)
        async let reviewsDetails = await getReviews(id: movieId)
        async let castDetails = await getCast(id: movieId)

        let deteailsViewModel: MovieDetailsModel = await .init(
            info: map(movieDetails: movieDetails),
            reviews: map(reviewsResponse: reviewsDetails),
            cast: map(castResponse: castDetails))

        await MainActor.run { [weak self] in
            self?.state = .loaded(deteailsViewModel)
        }
    }
}

extension Container {
    static func movieDetailsViewModel(movieId: Int) -> MovieDetailsViewModel {
        return MovieDetailsViewModel(movieId: movieId,
                                     movieDetailsUseCase: Container.getDetailsUseCase,
                                     reviewsUseCase: Container.getReviewsUseCase,
                                     castUseCase: Container.getCastUseCase)
    }
}
