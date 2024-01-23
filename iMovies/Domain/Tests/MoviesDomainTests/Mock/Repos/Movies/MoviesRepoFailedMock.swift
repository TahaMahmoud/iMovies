//
//  MoviesRepoFailedMock.swift
//
//
//  Created by Taha Mahmoud on 22/01/2024.
//

import Foundation
@testable import CoreDomain
@testable import MoviesDomain

struct MoviesRepoFailedMock: MoviesRepoProtocol {
    func getHighlights(_ input: GetMoviesRepoInput) async -> Result<MoviesListResponse, MoviesError> {
        .failure(.unknown)
    }
    
    func getNowPlaying(_ input: GetMoviesRepoInput) async -> Result<MoviesListResponse, MoviesError> {
        .failure(.unknown)
    }
    
    func getPopular(_ input: GetMoviesRepoInput) async -> Result<MoviesListResponse, MoviesError> {
        .failure(.unknown)
    }
    
    func getTopRated(_ input: GetMoviesRepoInput) async -> Result<MoviesListResponse, MoviesError> {
        .failure(.unknown)
    }
    
    func getUpcoming(_ input: GetMoviesRepoInput) async -> Result<MoviesListResponse, MoviesError> {
        .failure(.unknown)
    }
    
    func getDetails(_ input: GetDetailsRepoInput) async -> Result<MoviesDetailsResponse, MoviesError> {
        .failure(.unknown)
    }
    
    func getReviews(_ input: GetReviewsRepoInput) async -> Result<ReviewsResponse, MoviesError> {
        .failure(.unknown)
    }
    
    func getCast(_ input: GetCastRepoInput) async -> Result<CastResponse, MoviesError> {
        .failure(.unknown)
    }
    
    func search(_ input: SearchRepoInput) async -> Result<MoviesListResponse, MoviesError> {
        .failure(.unknown)
    }
}
