//
//  GetHighlightesUseCases.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import Foundation

public protocol GetHighlightsUseCaseProtocol {
    func execute() async -> Result<MoviesListResponse, MoviesError>
}

public struct GetHighlightsUseCase: GetHighlightsUseCaseProtocol {
    private let repo: MoviesRepoProtocol

    public init(repo: MoviesRepoProtocol) {
        self.repo = repo
    }

    public func execute() async -> Result<MoviesListResponse,
                                          MoviesError> {
        await repo.getHighlights()
    }
}
