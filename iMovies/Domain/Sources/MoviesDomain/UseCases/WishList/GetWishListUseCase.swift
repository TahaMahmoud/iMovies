//
//  GetWishListUseCase.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import Foundation

public protocol GetWishListUseCaseProtocol {
    func execute() async -> Result<[WishListItemProtocol],
        MoviesError>
}

public struct GetWishListUseCase: GetWishListUseCaseProtocol {
    private let repo: WishListRepoProtocol

    public init(repo: WishListRepoProtocol) {
        self.repo = repo
    }

    public func execute() async -> Result<[WishListItemProtocol],
        MoviesError> {
        await repo.get()
    }
}
