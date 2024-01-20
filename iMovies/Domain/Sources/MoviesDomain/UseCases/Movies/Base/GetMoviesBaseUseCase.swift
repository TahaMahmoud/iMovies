//
//  GetMoviesBaseUseCase.swift
//
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import Foundation

public protocol GetMoviesBaseUseCaseProtocol {
    func execute(
        _ input: GetMoviesUseCaseInputProtocol
    ) async -> Result<MoviesListResponse,
        MoviesError>
}
