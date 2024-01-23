//
//  WishlistRepoFailedMock.swift
//
//
//  Created by Taha Mahmoud on 23/01/2024.
//

@testable import CoreDomain
import Foundation
@testable import MoviesDomain

struct WishlistRepoFailedMock: WishListRepoProtocol {
    func get() async -> Result<[WishListItemProtocol], MoviesError> {
        .failure(.unknown)
    }

    func add(_ input: WishListItemProtocol) async -> Bool {
        return false
    }

    func remove(_ input: Int) async -> Bool {
        return false
    }

    func isInWishList(_ input: Int) async -> Bool {
        return false
    }
}
