//
//  DIContainer+MoviesUseCase.swift
//  iMovies
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import ConfigData
import Foundation
import MoviesData
import MoviesDomain

extension Container {
    static var getHighlightsUseCase: GetHighlightsUseCaseProtocol {
        return GetHighlightsUseCase(repo: DIContainer.moviesRepo)
    }

    static var getCastUseCase: GetCastUseCaseProtocol {
        return GetCastUseCase(repo: DIContainer.moviesRepo)
    }

    static var getDetailsUseCase: GetDetailsUseCaseProtocol {
        return GetDetailsUseCase(repo: DIContainer.moviesRepo)
    }

    static var getNowPlayingUseCase: GetNowPlayingUseCaseProtocol {
        return GetNowPlayingUseCase(repo: DIContainer.moviesRepo)
    }

    static var getPopularUseCase: GetPopularUseCaseProtocol {
        return GetPopularUseCase(repo: DIContainer.moviesRepo)
    }

    static var getReviewsUseCase: GetReviewsUseCaseProtocol {
        return GetReviewsUseCase(repo: DIContainer.moviesRepo)
    }

    static var getTopRatedUseCase: GetTopRatedUseCaseProtocol {
        return GetTopRatedUseCase(repo: DIContainer.moviesRepo)
    }

    static var getUpcomingUseCase: GetUpcomingUseCaseProtocol {
        return GetUpcomingUseCase(repo: DIContainer.moviesRepo)
    }

    static var searchUseCase: SearchUseCaseProtocol {
        return SearchUseCase(repo: DIContainer.moviesRepo)
    }
}
