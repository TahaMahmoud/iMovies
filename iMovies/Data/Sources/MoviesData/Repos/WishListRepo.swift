//
//  WishListRepo.swift
//
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import CoreDomain
import Foundation
import MoviesDomain

public struct WishListRepo: WishListRepoProtocol {
    private let localDataSource: LocalWishListDataSourceProtocol

    public init(localDataSource: LocalWishListDataSourceProtocol) {
        self.localDataSource = localDataSource
    }

    public func get() async -> Result<[WishListItemProtocol], MoviesError> {
        await localDataSource.get()
    }

    public func add(_ input: WishListItemProtocol) async -> Bool {
        await localDataSource.add(input)
    }

    public func remove(_ input: Int) async -> Bool {
        await localDataSource.remove(input)
    }

    public func isInWishList(_ input: Int) async -> Bool {
        await localDataSource.isInWishlist(input)
    }
}
