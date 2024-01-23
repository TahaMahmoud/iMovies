//
//  CategoryViewModel.swift
//  iMovies
//
//  Created by Taha Mahmoud on 21/01/2024.
//

import Combine
import Foundation
import MoviesDomain
import Stinsen
import SwiftUI

struct CategoryViewModelInput {
    var category: MovieCategory
    var categoryMoviesUseCase: any GetMoviesBaseUseCaseProtocol
}

final class CategoryViewModel: LoadableObject {
    @Published var state: ViewState<[MovieItemViewModel]> = .loading
    @Published var isListFullLoaded = false

    var currentPage: Int = 1
    var totalPages: Int = 0

    var movies: [MovieItemViewModel] = []

    @RouterObject
    var router: CategoryCoordinator.Router?

    var category: MovieCategory

    var getMovies: PassthroughSubject<Void, Never> = .init()
    var reload: PassthroughSubject<Void, Never> = .init()
    var movieDetails: PassthroughSubject<Int, Never> = .init()

    private var cancellables = Set<AnyCancellable>()

    let categoryMoviesUseCase: any GetMoviesBaseUseCaseProtocol

    init(input: CategoryViewModelInput) {
        self.category = input.category
        self.categoryMoviesUseCase = input.categoryMoviesUseCase

        subscribeToViewDidLoad()
        subscribeToReload()
        subscribeToMovieDetails()
    }

    func load() {
        if movies.isEmpty {
            getMovies.send()
        }
    }

    func subscribeToViewDidLoad() {
        getMovies
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                Task {
                    await self.getMovies(showLoading: true)
                }
            }
            .store(in: &cancellables)
    }

    func didFinishScroll() {
        guard isListFullLoaded == false else {
            return
        }

        if currentPage < totalPages {
            currentPage += 1
            Task {
                await self.getMovies(showLoading: false)
            }
        }

        isListFullLoaded = currentPage == totalPages
    }

    func getMovies(showLoading: Bool) async {
        if showLoading {
            await MainActor.run {
                state = .loading
            }
        }
        let input = GetMoviesUseCaseInput(page: currentPage)
        let result = await categoryMoviesUseCase.execute(input)
        await MainActor.run {
            map(moviesResponse: result)
        }
    }

    func map(moviesResponse: Result<MoviesListResponse, MoviesError>) {
        switch moviesResponse {
        case let .success(response):
            guard let movies = response.results,
                  !movies.isEmpty else {
                state = .empty
                return
            }

            totalPages = response.totalPages ?? 1
            currentPage = response.page ?? 1

            self.movies.append(contentsOf: movies.map {
                MovieItemViewModel(id: $0.id ?? 0,
                                   name: $0.title ?? "",
                                   rate: $0.voteAverage ?? 0,
                                   genres: ($0.genreIDS ?? []).map { id in
                                       MovieGenre(rawValue: id)?.name ?? ""
                                   },
                                   year: $0.releaseDate ?? "",
                                   poster: URLBuilder.getFullPath(path: $0.posterPath))
            })
            state = .loaded(self.movies)
        case .failure:
            state = .failed(MoviesError.unknown)
        }
    }

    func subscribeToReload() {
        movies.removeAll()
        getMovies.send()
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
    static func categoryViewModel(input: CategoryViewModelInput) -> CategoryViewModel {
        return CategoryViewModel(input: input)
    }
}
