//
//  AddToWishListUseCase.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import Foundation

public protocol AddToWishListUseCaseProtocol {
    func execute(
        _ input: WishListItemProtocol
    ) async -> Bool
}

public struct AddToWishListUseCase: AddToWishListUseCaseProtocol {
    private let repo: WishListRepoProtocol

    public init(repo: WishListRepoProtocol) {
        self.repo = repo
    }

    public func execute(
        _ input: WishListItemProtocol
    ) async -> Bool {
        await repo.add(input)
    }
}
