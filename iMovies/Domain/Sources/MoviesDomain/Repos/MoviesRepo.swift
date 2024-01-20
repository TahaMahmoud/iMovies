//
//  MoviesRepo.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

public typealias GetMoviesRepoInput = GetMoviesUseCaseInputProtocol
public typealias SearchRepoInput = SearchUseCaseInputProtocol
public typealias GetReviewsRepoInput = GetReviewsUseCaseInputProtocol
public typealias GetCastRepoInput = GetCastUseCaseInputProtocol
public typealias GetDetailsRepoInput = GetDetailsUseCaseInputProtocol

public protocol MoviesRepoProtocol {
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
