//
//  GetReviewsUseCase.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import Foundation

public protocol GetReviewsUseCaseInputProtocol {
    var movieId: Int { get set }
}

public struct GetReviewsUseCaseInput: GetReviewsUseCaseInputProtocol {
    public var movieId: Int

    public init(movieId: Int) {
        self.movieId = movieId
    }
}

public protocol GetReviewsUseCaseProtocol {
    func execute(
        _ input: GetReviewsUseCaseInputProtocol
    ) async -> Result<ReviewsResponse,
        MoviesError>
}

public struct GetReviewsUseCase: GetReviewsUseCaseProtocol {
    private let repo: MoviesRepoProtocol

    public init(repo: MoviesRepoProtocol) {
        self.repo = repo
    }

    public func execute(
        _ input: GetReviewsUseCaseInputProtocol
    ) async -> Result<ReviewsResponse,
        MoviesError> {
        await repo.getReviews(input)
    }
}
