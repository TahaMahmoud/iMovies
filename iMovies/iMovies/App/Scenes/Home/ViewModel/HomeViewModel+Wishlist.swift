//
//  HomeViewModel+Wishlist.swift
//  iMovies
//
//  Created by Taha Mahmoud on 21/01/2024.
//

import Combine
import Core
import Foundation
import MoviesDomain

internal extension HomeViewModel {
    func isInWishList(movie: Movie) async -> Bool {
        let input = IsInWishListUseCaseInput(movieId: movie.id ?? 0)
        return await isInWislistUseCase.execute(input)
    }

    func addToWishList(movie: Movie) async -> Bool {
        if await isInWishList(movie: movie) {
            let input = WishListItem(movieId: movie.id ?? 0,
                                     title: movie.title ?? "",
                                     voteAverage: movie.voteAverage ?? 0,
                                     genres: movie.genreIDS ?? [],
                                     releaseDate: movie.releaseDate ?? "",
                                     poster: movie.posterPath ?? "")
            return await addToWishlistUseCase.execute(input)
        } else {
            return await removeFromWishlist(movie: movie)
        }
    }

    func removeFromWishlist(movie: Movie) async -> Bool {
        let input = RemoveFromWishListUseCaseInput(movieId: movie.id ?? 0)
        return await removeFromWishlistUseCase.execute(input)
    }
}
