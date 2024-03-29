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

    func getHomeSection(homeSection: HomeViewModelSection) async -> HomeSectionViewModel {
        let input = GetMoviesUseCaseInput(page: 1)
        let result = await homeSection.useCase.execute(input)

        switch result {
        case let .success(movies):
            return map(section: homeSection, response: movies)
        case .failure:
            return HomeSectionViewModel(category: homeSection.category,
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
                posterURL: URLBuilder.getFullPath(
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

    func map(section: HomeViewModelSection,
             response: MoviesListResponse) -> HomeSectionViewModel {
        guard let movies = response.results else {
            return HomeSectionViewModel(
                category: section.category,
                moviesList: [],
                seeMorePressed: { _ in })
        }
        return HomeSectionViewModel(
            category: section.category,
            moviesList: movies.shuffled().prefix(5).map {
                HomeMovieItemViewModel(id: $0.id ?? 0,
                                       posterURL: URLBuilder.getFullPath(
                                           path: $0.posterPath ?? ""),
                                       name: $0.title ?? "",
                                       rating: $0.voteAverage ?? 0) { movieId in
                    self.movieDetails.send(movieId)
                }
            }) { [weak self] category in
                let input = CategoryViewModelInput(
                    category: category,
                    categoryMoviesUseCase: section.useCase)
                self?.router?.route(to: \.category, input)
            }
    }

    func map(bannerResponse: BannerResponse) -> BannerModel {
        return BannerModel(image: bannerResponse.image ?? "",
                           title: bannerResponse.title ?? "",
                           description: bannerResponse.subTitle ?? "")
    }
}
