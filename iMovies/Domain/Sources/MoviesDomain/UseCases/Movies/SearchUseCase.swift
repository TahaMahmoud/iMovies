//
//  SearchUseCase.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import Foundation

public protocol SearchUseCaseInputProtocol: Pagable {
    var query: String { get set }
    var page: Int { get set }
}

public struct SearchUseCaseInput: SearchUseCaseInputProtocol {
    public var page: Int
    public var query: String

    public init(page: Int,
                query: String) {
        self.page = page
        self.query = query
    }
}

public protocol SearchUseCaseProtocol {
    func execute(
        _ input: SearchUseCaseInputProtocol
    ) async -> Result<MoviesListResponse,
        MoviesError>
}

public struct SearchUseCase: SearchUseCaseProtocol {
    private let repo: MoviesRepoProtocol

    public init(repo: MoviesRepoProtocol) {
        self.repo = repo
    }

    public func execute(
        _ input: SearchUseCaseInputProtocol
    ) async -> Result<MoviesListResponse,
        MoviesError> {
        await repo.search(input)
    }
}
