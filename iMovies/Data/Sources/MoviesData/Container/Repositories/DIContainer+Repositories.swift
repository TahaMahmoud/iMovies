//
//  DIContainer+Repositories.swift
//
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import ConfigData
import Foundation
import MoviesDomain

public extension DIContainer {
    static var moviesRepo: MoviesRepoProtocol {
        return MoviesRepo(remoteDataSource: remoteMoviesDataSource)
    }

    static var wishListRepo: WishListRepoProtocol {
        return WishListRepo(localDataSource: localWishListDataSource)
    }
}
