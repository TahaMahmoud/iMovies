//
//  GetWishlistResponseMock.swift
//
//
//  Created by Taha Mahmoud on 23/01/2024.
//

@testable import CoreDomain
import Foundation
@testable import MoviesDomain

var wishlistItems: [WishListItem] = [
    .init(movieId: 1,
          title: "Movie 1",
          voteAverage: 9.5,
          genres: [1, 2, 3],
          releaseDate: "2024/01/12",
          poster: "/path_to_movie_1.png"),
    .init(movieId: 2,
          title: "Movie 2",
          voteAverage: 9.5,
          genres: [1, 2, 3],
          releaseDate: "2024/01/12",
          poster: "/path_to_movie_2.png"),
    .init(movieId: 1,
          title: "Movie 3",
          voteAverage: 9.5,
          genres: [1, 2, 3],
          releaseDate: "2024/01/12",
          poster: "/path_to_movie_3.png")
]
