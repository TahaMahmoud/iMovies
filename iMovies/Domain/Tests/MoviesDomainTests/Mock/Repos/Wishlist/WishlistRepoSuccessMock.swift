//
//  WishlistRepoSuccessMock.swift
//
//
//  Created by Taha Mahmoud on 22/01/2024.
//

import Foundation
@testable import CoreDomain
@testable import MoviesDomain

class WishlistRepoSuccessMock: WishListRepoProtocol {
    func get() async -> Result<[WishListItemProtocol], MoviesError> {
        .success(wishlistItems)
    }
    
    func add(_ input: WishListItemProtocol) async -> Bool {
        return true
    }
    
    func remove(_ input: Int) async -> Bool {
        return true
    }
    
    func isInWishList(_ input: Int) async -> Bool {
        return true
    }
}
