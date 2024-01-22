//
//  WishlistRepoFailedMock.swift
//  
//
//  Created by Taha Mahmoud on 23/01/2024.
//

import Foundation
@testable import CoreDomain
@testable import MoviesDomain

class WishlistRepoFailedMock: WishListRepoProtocol {
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
