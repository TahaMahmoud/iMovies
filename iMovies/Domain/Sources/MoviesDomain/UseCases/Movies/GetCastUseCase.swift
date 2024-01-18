//
//  GetCastUseCase.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import Foundation

public protocol GetCastUseCaseInputProtocol {
    var movieId: Int { get set }
}

public struct GetCastUseCaseInput: GetCastUseCaseInputProtocol {
    public var movieId: Int

    public init(movieId: Int) {
        self.movieId = movieId
    }
}

public protocol GetCastUseCaseProtocol {
    func execute(
        _ input: GetCastUseCaseInputProtocol
    ) async -> Result<CastResponse,
        MoviesError>
}

public struct GetCastUseCase: GetCastUseCaseProtocol {
    private let repo: MoviesRepoProtocol

    public init(repo: MoviesRepoProtocol) {
        self.repo = repo
    }

    public func execute(
        _ input: GetCastUseCaseInputProtocol
    ) async -> Result<CastResponse,
        MoviesError> {
        await repo.getCast(input)
    }
}
