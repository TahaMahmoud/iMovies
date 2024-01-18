//
//  RemoveFromWishListUseCase.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import Foundation

public protocol RemoveFromWishListUseCaseInputProtocol {
    var movieId: Int { get set }
}

public struct RemoveFromWishListUseCaseInput: RemoveFromWishListUseCaseInputProtocol {
    public var movieId: Int

    public init(movieId: Int) {
        self.movieId = movieId
    }
}

public protocol RemoveFromWishListUseCaseProtocol {
    func execute(
        _ input: RemoveFromWishListUseCaseInputProtocol
    ) async -> Bool
}

public struct RemoveFromWishListUseCase: RemoveFromWishListUseCaseProtocol {
    private let repo: WishListRepoProtocol

    public init(repo: WishListRepoProtocol) {
        self.repo = repo
    }

    public func execute(
        _ input: RemoveFromWishListUseCaseInputProtocol
    ) async -> Bool {
        await repo.remove(input.movieId)
    }
}
