//
//  GetDetailsUseCaseInput.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import Foundation

public protocol GetDetailsUseCaseInputProtocol {
    var movieId: Int { get set }
}

public struct GetDetailsUseCaseInput: GetDetailsUseCaseInputProtocol {
    public var movieId: Int

    public init(movieId: Int) {
        self.movieId = movieId
    }
}

public protocol GetDetailsUseCaseProtocol {
    func execute(
        _ input: GetDetailsUseCaseInputProtocol
    ) async -> Result<MoviesDetailsResponse,
                      MoviesError>
}

public struct GetDetailsUseCase: GetDetailsUseCaseProtocol {
    private let repo: MoviesRepoProtocol

    public init(repo: MoviesRepoProtocol) {
        self.repo = repo
    }

    public func execute(
        _ input: GetDetailsUseCaseInputProtocol
    ) async -> Result<MoviesDetailsResponse,
                      MoviesError> {
        await repo.getDetails(input)
    }
}
