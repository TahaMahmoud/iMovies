//
//  SearchViewModel.swift
//  iMovies
//
//  Created by Taha Mahmoud on 21/01/2024.
//

import Combine
import Foundation
import MoviesDomain
import Stinsen
import SwiftUI

final class SearchViewModel: LoadableObject {
    @Published var state: ViewState<[MovieItemViewModel]> = .empty
    @Published var isListFullLoaded = true

    @Published var searchText: String = ""

    var currentPage: Int = 1
    var totalPages: Int = 0

    var movies: [MovieItemViewModel] = []

    @RouterObject
    var router: SearchCoordinator.Router?

    var viewDidLoad: PassthroughSubject<Void, Never> = .init()
    var search: PassthroughSubject<Void, Never> = .init()
    var movieDetails: PassthroughSubject<Int, Never> = .init()

    private var cancellables = Set<AnyCancellable>()

    let searchUseCase: any SearchUseCaseProtocol

    init(searchUseCase: any SearchUseCaseProtocol) {
        self.searchUseCase = searchUseCase

        load()
        subscribeToSearchPressed()
        subscribeToMovieDetails()
    }

    func load() {
        state = .loaded([])
    }

    func subscribeToSearchPressed() {
        search
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                Task {
                    await self.getMovies()
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
            search.send()
        }

        isListFullLoaded = currentPage == totalPages
    }

    func getMovies() async {
        await MainActor.run {
            state = .loading
        }
        let input = SearchUseCaseInput(page: currentPage, query: searchText)
        let result = await searchUseCase.execute(input)
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
                                   poster: MoviePosterURLBuilder.getFullPosterURL(path: $0.posterPath))
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
    static var searchViewModel: SearchViewModel {
        return SearchViewModel(searchUseCase: Container.searchUseCase)
    }
}
