//
//  GetPopularUseCase.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import Foundation

public protocol GetPopularUseCaseProtocol {
    func execute(
        _ input: GetMoviesUseCaseInputProtocol
    ) async -> Result<MoviesListResponse,
        MoviesError>
}

public struct GetPopularUseCase: GetPopularUseCaseProtocol {
    private let repo: MoviesRepoProtocol

    public init(repo: MoviesRepoProtocol) {
        self.repo = repo
    }

    public func execute(
        _ input: GetMoviesUseCaseInputProtocol
    ) async -> Result<MoviesListResponse,
                      MoviesError> {
        await repo.getPopular(input)
    }
}
