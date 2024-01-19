//
//  LocalWishListDataSource.swift
//
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import Foundation
import MoviesDomain
import Networking
import DataPersistence

public protocol LocalWishListDataSourceProtocol {
//    func getHighlights() async -> Result<MoviesListResponse,
//        MoviesError>
//    func getNowPlaying(_ input: GetMoviesRepoInput
//    ) async -> Result<MoviesListResponse,
//        MoviesError>
//    func getPopular(_ input: GetMoviesRepoInput
//    ) async -> Result<MoviesListResponse,
//        MoviesError>
//    func getTopRated(_ input: GetMoviesRepoInput
//    ) async -> Result<MoviesListResponse,
//        MoviesError>
//    func getUpcoming(_ input: GetMoviesRepoInput
//    ) async -> Result<MoviesListResponse,
//        MoviesError>
//    func getDetails(_ input: GetDetailsRepoInput
//    ) async -> Result<MoviesDetailsResponse,
//        MoviesError>
//    func getReviews(_ input: GetReviewsRepoInput
//    ) async -> Result<ReviewsResponse,
//        MoviesError>
//    func getCast(_ input: GetCastRepoInput
//    ) async -> Result<CastResponse,
//        MoviesError>
//    func search(_ input: SearchRepoInput
//    ) async -> Result<MoviesListResponse,
//        MoviesError>
}

public struct LocalWishListDataSource: LocalWishListDataSourceProtocol {
    private let dataManager: DataPersistenceManagerProtocol

    public init(dataManager: DataPersistenceManagerProtocol) {
        self.dataManager = dataManager
    }
}
