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
        case .success(let movies):
            return Array(map(response: movies).shuffled().prefix(5))
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
        case .success(let movies):
            return map(category: category, response: movies)
        case .failure(let failure):
            return HomeSectionViewModel(category: category,
                                        moviesList: [],
                                        seeMorePressed: { _ in })
        }
    }

    func getBanner() async -> BannerModel {
        let result = await bannerUseCase.execute()
        switch result {
        case .success(let banner):
            return map(bannerResponse: banner)
        case .failure:
            return BannerModel(image: "",
                               title: "",
                               description: "",
                               detailsPressed: {})
        }
    }
}

extension HomeViewModel {
    func map(response: MoviesListResponse) -> [HighlightsMovie] {
        guard let movies = response.results else { return [] }
        return movies.map {
            HighlightsMovie(
                posterURL: MoviePosterURLBuilder.getFullPosterURL(
                path: $0.posterPath ?? ""),
            isAddedToWishlist: false,
            didPressDetails: { _ in },
            didPressWishlist: { _ in })
        }
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
                HomeMovieItemViewModel(posterURL: MoviePosterURLBuilder.getFullPosterURL(
                    path: $0.posterPath ?? ""),
                                       name: $0.title ?? "",
                                       rating: $0.voteAverage ?? 0)
            }) { category in
                print("See more pressed on \(category)")
            }
    }

    func map(bannerResponse: BannerResponse) -> BannerModel {
        return BannerModel(image: bannerResponse.image ?? "",
                           title: bannerResponse.title ?? "",
                           description: bannerResponse.subTitle ?? "",
                           detailsPressed: {})
    }
}
