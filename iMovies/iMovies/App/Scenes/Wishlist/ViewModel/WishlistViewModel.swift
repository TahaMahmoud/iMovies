//
//  WishlistViewModel.swift
//  iMovies
//
//  Created by Taha Mahmoud on 21/01/2024.
//

import Combine
import Foundation
import MoviesDomain
import Stinsen
import SwiftUI

final class WishlistViewModel: LoadableObject {
    @Published var state: ViewState<[MovieItemViewModel]> = .loading

    var movies: [MovieItemViewModel] = []

    @RouterObject
    var router: WishlistCoordinator.Router?

    var viewDidLoad: PassthroughSubject<Void, Never> = .init()
    var movieDetails: PassthroughSubject<Int, Never> = .init()

    private var cancellables = Set<AnyCancellable>()

    let getWishListUseCase: any GetWishListUseCaseProtocol

    init(getWishListUseCase: any GetWishListUseCaseProtocol) {
        self.getWishListUseCase = getWishListUseCase

        subscribeToViewDidLoad()
        subscribeToMovieDetails()
    }

    func load() {
        if movies.isEmpty {
            viewDidLoad.send()
        }
    }

    func subscribeToViewDidLoad() {
        viewDidLoad
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                Task {
                    await self.getWishlist()
                }
            }
            .store(in: &cancellables)
    }

    func getWishlist() async {
        await MainActor.run {
            state = .loading
        }

        let result = await getWishListUseCase.execute()
        await MainActor.run {
            map(wishList: result)
        }
    }

    func map(wishList: Result<[WishListItemProtocol], MoviesError>) {
        switch wishList {
        case let .success(response):
            self.movies.append(contentsOf: response.map {
                MovieItemViewModel(id: $0.movieId,
                                   name: $0.title,
                                   rate: $0.voteAverage,
                                   genres: $0.genres.map { id in
                                       MovieGenre(rawValue: id)?.name ?? ""
                                   },
                                   year: $0.releaseDate,
                                   poster: MoviePosterURLBuilder.getFullPosterURL(path: $0.poster))
            })
            state = .loaded(self.movies)
        case .failure:
            state = .failed(MoviesError.unknown)
        }
    }

    func subscribeToMovieDetails() {
        movieDetails
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] index in
                guard let self = self else { return }
                let movieId = self.movies[index].id
                self.router?.route(to: \.movieDetails, movieId)
            }
            .store(in: &cancellables)
    }
}

extension Container {
    static var wishListViewModel: WishlistViewModel {
        return WishlistViewModel(getWishListUseCase: Container.getWishlistUseCase)
    }
}
