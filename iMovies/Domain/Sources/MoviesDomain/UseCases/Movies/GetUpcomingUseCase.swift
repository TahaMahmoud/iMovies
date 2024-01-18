//
//  GetUpcomingUseCase.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import Foundation

public protocol GetUpcomingUseCaseProtocol {
    func execute(
        _ input: GetMoviesUseCaseInputProtocol
    ) async -> Result<MoviesListResponse,
        MoviesError>
}

public struct GetUpcomingUseCase: GetUpcomingUseCaseProtocol {
    private let repo: MoviesRepoProtocol

    public init(repo: MoviesRepoProtocol) {
        self.repo = repo
    }

    public func execute(
        _ input: GetMoviesUseCaseInputProtocol
    ) async -> Result<MoviesListResponse,
                      MoviesError> {
        await repo.getUpcoming(input)
    }
}
