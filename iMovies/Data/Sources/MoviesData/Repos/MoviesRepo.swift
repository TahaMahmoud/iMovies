//
//  MoviesRepo.swift
//
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import CoreDomain
import Foundation
import MoviesDomain

public struct MoviesRepo: MoviesRepoProtocol {
    private let remoteDataSource: RemoteMoviesDataSourceProtocol

    public init(remoteDataSource: RemoteMoviesDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }

    public func getHighlights(_ input: GetMoviesRepoInput) async -> Result<MoviesListResponse,
        MoviesError> {
        await remoteDataSource.getHighlights(input)
    }

    public func getNowPlaying(_ input: GetMoviesRepoInput) async -> Result<MoviesListResponse,
        MoviesError> {
        await remoteDataSource.getNowPlaying(input)
    }

    public func getPopular(_ input: GetMoviesRepoInput) async -> Result<MoviesListResponse,
        MoviesError> {
        await remoteDataSource.getPopular(input)
    }

    public func getTopRated(_ input: GetMoviesRepoInput) async -> Result<MoviesListResponse,
        MoviesError> {
        await remoteDataSource.getTopRated(input)
    }

    public func getUpcoming(_ input: GetMoviesRepoInput) async -> Result<MoviesListResponse,
        MoviesError> {
        await remoteDataSource.getUpcoming(input)
    }

    public func getDetails(_ input: GetDetailsRepoInput) async -> Result<MoviesDetailsResponse,
        MoviesError> {
        await remoteDataSource.getDetails(input)
    }

    public func getReviews(_ input: GetReviewsRepoInput) async -> Result<ReviewsResponse,
        MoviesError> {
            await remoteDataSource.getReviews(input)
    }

    public func getCast(_ input: MoviesDomain.GetCastRepoInput) async -> Result<CastResponse,
                                                                                MoviesError> {
        await remoteDataSource.getCast(input)
    }

    public func search(_ input: SearchRepoInput) async -> Result<MoviesListResponse,
                                                                 MoviesError> {
        await remoteDataSource.search(input)
    }
}
