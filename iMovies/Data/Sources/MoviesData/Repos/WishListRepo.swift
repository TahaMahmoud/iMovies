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
        .success([])
    }

    public func add(_ input: WishListItemProtocol) async -> Bool {
        true
    }

    public func remove(_ input: Int) async -> Bool {
        true
    }
}
