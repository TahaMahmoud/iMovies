//
//  WishListRepo.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

public protocol WishListRepoProtocol {
    func get() async -> Result<[WishListItemProtocol], MoviesError>
    func add(_ input: WishListItemProtocol) async -> Bool
    func remove(_ input: Int) async -> Bool
    func isInWishList(_ input: Int) async -> Bool
}
