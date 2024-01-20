//
//  RemoteMoviesDataSource.swift
//
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import Foundation
import MoviesDomain
import Networking

public protocol RemoteMoviesDataSourceProtocol {
    func getHighlights(_ input: GetMoviesRepoInput
    ) async -> Result<MoviesListResponse,
        MoviesError>
    func getNowPlaying(_ input: GetMoviesRepoInput
    ) async -> Result<MoviesListResponse,
        MoviesError>
    func getPopular(_ input: GetMoviesRepoInput
    ) async -> Result<MoviesListResponse,
        MoviesError>
    func getTopRated(_ input: GetMoviesRepoInput
    ) async -> Result<MoviesListResponse,
        MoviesError>
    func getUpcoming(_ input: GetMoviesRepoInput
    ) async -> Result<MoviesListResponse,
        MoviesError>
    func getDetails(_ input: GetDetailsRepoInput
    ) async -> Result<MoviesDetailsResponse,
        MoviesError>
    func getReviews(_ input: GetReviewsRepoInput
    ) async -> Result<ReviewsResponse,
        MoviesError>
    func getCast(_ input: GetCastRepoInput
    ) async -> Result<CastResponse,
        MoviesError>
    func search(_ input: SearchRepoInput
    ) async -> Result<MoviesListResponse,
        MoviesError>
}

public struct RemoteMoviesDataSource: RemoteMoviesDataSourceProtocol {
    private let networkingManger: NetworkManagerProtocol

    public init(networkingManger: NetworkManagerProtocol) {
        self.networkingManger = networkingManger
    }

    public func getHighlights(
        _ input: MoviesDomain.GetMoviesRepoInput
    ) async -> Result<MoviesListResponse, MoviesError> {
        let endpoint = MoviesEndpoint.highlights
        let result: Result<MoviesListResponse.DTO, NetworkRequestError<MoviesError.DTO>>
        result = await networkingManger.executeRequest(endpoint,
                                                       appErrors: nil).result
        switch result {
        case let .success(dto):
            return .success(MoviesListResponse(from: dto))
        case let .failure(error):
            switch error {
            case let .appError(dto):
                return .failure(MoviesError(from: dto))
            case let .failure(reason):
                return .failure(MoviesError.unknown)
            }
        }
    }

    public func getNowPlaying(
        _ input: MoviesDomain.GetMoviesRepoInput
    ) async -> Result<MoviesListResponse, MoviesError> {
        let endpoint = MoviesEndpoint.nowPlaying(page: input.page)
        let result: Result<MoviesListResponse.DTO, NetworkRequestError<MoviesError.DTO>>
        result = await networkingManger.executeRequest(endpoint,
                                                       appErrors: nil).result
        switch result {
        case let .success(dto):
            return .success(MoviesListResponse(from: dto))
        case let .failure(error):
            switch error {
            case let .appError(dto):
                return .failure(MoviesError(from: dto))
            case let .failure(reason):
                return .failure(MoviesError.unknown)
            }
        }

    }

    public func getPopular(
        _ input: GetMoviesRepoInput
    ) async -> Result<MoviesListResponse, MoviesError> {
        let endpoint = MoviesEndpoint.popular(page: input.page)
        let result: Result<MoviesListResponse.DTO, NetworkRequestError<MoviesError.DTO>>
        result = await networkingManger.executeRequest(endpoint,
                                                       appErrors: nil).result
        switch result {
        case let .success(dto):
            return .success(MoviesListResponse(from: dto))
        case let .failure(error):
            switch error {
            case let .appError(dto):
                return .failure(MoviesError(from: dto))
            case let .failure(reason):
                return .failure(MoviesError.unknown)
            }
        }

    }

    public func getTopRated(
        _ input: GetMoviesRepoInput
    ) async -> Result<MoviesListResponse, MoviesError> {
        let endpoint = MoviesEndpoint.topRated(page: input.page)
        let result: Result<MoviesListResponse.DTO, NetworkRequestError<MoviesError.DTO>>
        result = await networkingManger.executeRequest(endpoint,
                                                       appErrors: nil).result
        switch result {
        case let .success(dto):
            return .success(MoviesListResponse(from: dto))
        case let .failure(error):
            switch error {
            case let .appError(dto):
                return .failure(MoviesError(from: dto))
            case let .failure(reason):
                return .failure(MoviesError.unknown)
            }
        }

    }

    public func getUpcoming(
        _ input: GetMoviesRepoInput
    ) async -> Result<MoviesListResponse, MoviesError> {
        let endpoint = MoviesEndpoint.upcoming(page: input.page)
        let result: Result<MoviesListResponse.DTO, NetworkRequestError<MoviesError.DTO>>
        result = await networkingManger.executeRequest(endpoint,
                                                       appErrors: nil).result
        switch result {
        case let .success(dto):
            return .success(MoviesListResponse(from: dto))
        case let .failure(error):
            switch error {
            case let .appError(dto):
                return .failure(MoviesError(from: dto))
            case let .failure(reason):
                return .failure(MoviesError.unknown)
            }
        }

    }

    public func getDetails(
        _ input: GetDetailsRepoInput
    ) async -> Result<MoviesDetailsResponse, MoviesError> {
        let endpoint = MoviesEndpoint.movieDetails(id: input.movieId)
        let result: Result<MoviesDetailsResponse.DTO, NetworkRequestError<MoviesError.DTO>>
        result = await networkingManger.executeRequest(endpoint,
                                                       appErrors: nil).result
        switch result {
        case let .success(dto):
            return .success(MoviesDetailsResponse(from: dto))
        case let .failure(error):
            switch error {
            case let .appError(dto):
                return .failure(MoviesError(from: dto))
            case let .failure(reason):
                return .failure(MoviesError.unknown)
            }
        }

    }

    public func getReviews(
        _ input: GetReviewsRepoInput
    ) async -> Result<ReviewsResponse, MoviesError> {
        let endpoint = MoviesEndpoint.reviews(movieId: input.movieId)
        let result: Result<ReviewsResponse.DTO, NetworkRequestError<MoviesError.DTO>>
        result = await networkingManger.executeRequest(endpoint,
                                                       appErrors: nil).result
        switch result {
        case let .success(dto):
            return .success(ReviewsResponse(from: dto))
        case let .failure(error):
            switch error {
            case let .appError(dto):
                return .failure(MoviesError(from: dto))
            case let .failure(reason):
                return .failure(MoviesError.unknown)
            }
        }

    }

    public func getCast(
        _ input: GetCastRepoInput
    ) async -> Result<CastResponse, MoviesError> {
        let endpoint = MoviesEndpoint.cast(movieId: input.movieId)
        let result: Result<CastResponse.DTO, NetworkRequestError<MoviesError.DTO>>
        result = await networkingManger.executeRequest(endpoint,
                                                       appErrors: nil).result
        switch result {
        case let .success(dto):
            return .success(CastResponse(from: dto))
        case let .failure(error):
            switch error {
            case let .appError(dto):
                return .failure(MoviesError(from: dto))
            case let .failure(reason):
                return .failure(MoviesError.unknown)
            }
        }

    }

    public func search(
        _ input: SearchRepoInput
    ) async -> Result<MoviesListResponse, MoviesError> {
        let endpoint = MoviesEndpoint.movies(query: input.query, page: input.page)
        let result: Result<MoviesListResponse.DTO, NetworkRequestError<MoviesError.DTO>>
        result = await networkingManger.executeRequest(endpoint,
                                                       appErrors: nil).result
        switch result {
        case let .success(dto):
            return .success(MoviesListResponse(from: dto))
        case let .failure(error):
            switch error {
            case let .appError(dto):
                return .failure(MoviesError(from: dto))
            case let .failure(reason):
                return .failure(MoviesError.unknown)
            }
        }

    }
}
