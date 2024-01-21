//
//  LocalWishListDataSource.swift
//
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import DataPersistence
import Foundation
import MoviesDomain
import Networking

public protocol LocalWishListDataSourceProtocol {
    func get() async -> Result<[WishListItemProtocol], MoviesError>
    func add(_ input: WishListItemProtocol) async -> Bool
    func remove(_ input: Int) async -> Bool
    func isInWishlist(_ input: Int) async -> Bool
}

public struct LocalWishListDataSource: LocalWishListDataSourceProtocol {
    private var wishlistKey = "wishlist"

    private let dataManager: DataPersistenceManagerProtocol

    public init(dataManager: DataPersistenceManagerProtocol) {
        self.dataManager = dataManager
    }

    public func get() async -> Result<[WishListItemProtocol], MoviesError> {
        let items = getWishlistItems()

        return .success(
            items.map { item in
                WishListItem(movieId: item.movieId,
                             title: item.title,
                             voteAverage: item.voteAverage,
                             genres: item.genres,
                             releaseDate: item.releaseDate,
                             poster: item.poster)
            }
        )
    }

    public func isInWishlist(_ input: Int) async -> Bool {
        let items = getWishlistItems()
        return items.contains { $0.movieId == input }
    }

    public func add(_ input: WishListItemProtocol) async -> Bool {
        var items = getWishlistItems()
        let isExist = items.contains { $0.movieId == input.movieId }
        if isExist {
            return false
        } else {
            let item = WishListItem(movieId: input.movieId,
                                    title: input.title,
                                    voteAverage: input.voteAverage,
                                    genres: input.genres,
                                    releaseDate: input.releaseDate,
                                    poster: input.poster)
            items.append(item)
            updateWishlistItems(items: items)
            return true
        }
    }

    public func remove(_ input: Int) async -> Bool {
        var items = getWishlistItems()
        let isExist = items.contains { $0.movieId == input }
        if !isExist {
            return false
        } else {
            let updatedItems = items.filter { $0.movieId != input }
            updateWishlistItems(items: updatedItems)
            return true
        }
    }

    private func getWishlistItems() -> [WishListItem] {
        return dataManager.retrieve([WishListItem].self,
                                    forKey: wishlistKey,
                                    using: .userDefaults) ?? []
    }

    private func updateWishlistItems(items: [WishListItem]) {
        dataManager.update(data: items,
                           forKey: wishlistKey,
                           using: .userDefaults)
    }
}
