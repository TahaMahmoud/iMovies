//
//  IsInWishListUseCase.swift
//
//
//  Created by Taha Mahmoud on 21/01/2024.
//

import Foundation

public protocol IsInWishListUseCaseInputProtocol {
    var movieId: Int { get set }
}

public struct IsInWishListUseCaseInput: IsInWishListUseCaseInputProtocol {
    public var movieId: Int

    public init(movieId: Int) {
        self.movieId = movieId
    }
}

public protocol IsInWishListUseCaseProtocol {
    func execute(
        _ input: IsInWishListUseCaseInputProtocol
    ) async -> Bool
}

public struct IsInWishListUseCase: IsInWishListUseCaseProtocol {
    private let repo: WishListRepoProtocol

    public init(repo: WishListRepoProtocol) {
        self.repo = repo
    }

    public func execute(
        _ input: IsInWishListUseCaseInputProtocol
    ) async -> Bool {
        await repo.remove(input.movieId)
    }
}
