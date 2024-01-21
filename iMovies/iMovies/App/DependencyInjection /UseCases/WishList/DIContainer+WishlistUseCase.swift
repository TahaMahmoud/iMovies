//
//  DIContainer+WishlistUseCase.swift
//  iMovies
//
//  Created by Taha Mahmoud on 21/01/2024.
//

import ConfigData
import Foundation
import MoviesData
import MoviesDomain

extension Container {
    static var addToWishlistUseCase: AddToWishListUseCaseProtocol {
        return AddToWishListUseCase(repo: DIContainer.wishListRepo)
    }

    static var removeFromWishlistUseCase: RemoveFromWishListUseCaseProtocol {
        return RemoveFromWishListUseCase(repo: DIContainer.wishListRepo)
    }

    static var getWishlist: GetWishListUseCaseProtocol {
        return GetWishListUseCase(repo: DIContainer.wishListRepo)
    }
}
