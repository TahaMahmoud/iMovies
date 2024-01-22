//
//  HomeViewModel+UseCaseExecute.swift
//  iMovies
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import Combine
import Core
import Foundation
import MoviesDomain

extension HomeViewModel {
    func getHighlights() async -> [HighlightsMovie] {
        let input = GetMoviesUseCaseInput(page: 1)
        let result = await highlightsUseCase.execute(input)

        switch result {
        case let .success(movies):
            return await Array(map(response: movies).shuffled().prefix(5))
        case .failure:
            return []
        }
    }

    func getHomeSection(category: MovieCategory) async -> HomeSectionViewModel {
        let input = GetMoviesUseCaseInput(page: 1)
        var useCase: GetMoviesBaseUseCaseProtocol
        switch category {
        case .nowPlaying:
            useCase = nowPlayingUseCase
        case .popular:
            useCase = popularUseCase
        case .topRated:
            useCase = topRatedUseCase
        case .upcoming:
            useCase = upcommingUseCase
        }

        let result = await useCase.execute(input)

        switch result {
        case let .success(movies):
            return map(category: category, response: movies)
        case .failure:
            return HomeSectionViewModel(category: category,
                                        moviesList: [],
                                        seeMorePressed: { _ in })
        }
    }

    func getBanner() async -> BannerModel {
        let result = await bannerUseCase.execute()
        switch result {
        case let .success(banner):
            return map(bannerResponse: banner)
        case .failure:
            return BannerModel(image: "",
                               title: "",
                               description: "")
        }
    }
}

extension HomeViewModel {
    func map(response: MoviesListResponse) async -> [HighlightsMovie] {
        guard let movies = response.results else { return [] }
        var mappedMovies: [HighlightsMovie] = []
        for movie in movies {
            mappedMovies.append(HighlightsMovie(
                posterURL: MoviePosterURLBuilder.getFullPosterURL(
                    path: movie.posterPath ?? ""),
                isAddedToWishlist: await isInWishList(movie: movie),
                didPressDetails: { [weak self] in
                    guard let self = self else { return }
                    let movieId = movie.id ?? 0
                    self.router?.route(to: \.movieDetails, movieId)
                },
                didPressWishlist: {
                    Task { [weak self] in
                        await self?.addToWishList(movie: movie)
                    }
                })
            )
        }
        return mappedMovies
    }

    func map(category: MovieCategory,
             response: MoviesListResponse) -> HomeSectionViewModel {
        guard let movies = response.results else {
            return HomeSectionViewModel(
                category: category,
                moviesList: [],
                seeMorePressed: { _ in })
        }
        return HomeSectionViewModel(
            category: category,
            moviesList: movies.shuffled().prefix(5).map {
                HomeMovieItemViewModel(id: $0.id ?? 0,
                                       posterURL: MoviePosterURLBuilder.getFullPosterURL(
                                           path: $0.posterPath ?? ""),
                                       name: $0.title ?? "",
                                       rating: $0.voteAverage ?? 0) { movieId in
                    self.movieDetails.send(movieId)
                }
            }) { [weak self] category in
                let input = CategoryViewModelInput(
                    category: category,
                    categoryMoviesUseCase: self?.getUseCase(
                        category: category) ?? Container.getNowPlayingUseCase)
                self?.router?.route(to: \.category, input)
            }
    }

    func map(bannerResponse: BannerResponse) -> BannerModel {
        return BannerModel(image: bannerResponse.image ?? "",
                           title: bannerResponse.title ?? "",
                           description: bannerResponse.subTitle ?? "")
    }

    func getUseCase(category: MovieCategory) -> GetMoviesBaseUseCaseProtocol {
        switch category {
        case .nowPlaying:
            return nowPlayingUseCase
        case .popular:
            return popularUseCase
        case .topRated:
            return topRatedUseCase
        case .upcoming:
            return upcommingUseCase
        }
    }
}
