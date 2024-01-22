//
//  MoviesRepoSuccessMock.swift
//
//
//  Created by Taha Mahmoud on 22/01/2024.
//

import Foundation
@testable import CoreDomain
@testable import MoviesDomain

class MoviesRepoSuccessMock: MoviesRepoProtocol {
    func getHighlights(_ input: GetMoviesRepoInput) async -> Result<MoviesListResponse, MoviesError> {
        .success(moviesListModelSuccessMock)
    }

    func getNowPlaying(_ input: GetMoviesRepoInput) async -> Result<MoviesListResponse, MoviesError> {
        .success(moviesListModelSuccessMock)
    }

    func getPopular(_ input: GetMoviesRepoInput) async -> Result<MoviesListResponse, MoviesError> {
        .success(moviesListModelSuccessMock)
    }

    func getTopRated(_ input: GetMoviesRepoInput) async -> Result<MoviesListResponse, MoviesError> {
        .success(moviesListModelSuccessMock)
    }

    func getUpcoming(_ input: GetMoviesRepoInput) async -> Result<MoviesListResponse, MoviesError> {
        .success(moviesListModelSuccessMock)
    }

    func getDetails(_ input: GetDetailsRepoInput) async -> Result<MoviesDetailsResponse, MoviesError> {
        .success(moviesDetailsModelSuccessMock)
    }

    func getReviews(_ input: GetReviewsRepoInput) async -> Result<ReviewsResponse, MoviesError> {
        .success(reviewsResponseSuccessMock)
    }

    func getCast(_ input: GetCastRepoInput) async -> Result<CastResponse, MoviesError> {
        .success(castResponseSuccessMock)
    }

    func search(_ input: SearchRepoInput) async -> Result<MoviesListResponse, MoviesError> {
        .success(moviesListModelSuccessMock)
    }
}
