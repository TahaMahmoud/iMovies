//
//  MoviesDetailsModelSuccessMock.swift
//
//
//  Created by Taha Mahmoud on 22/01/2024.
//

import Foundation
@testable import CoreDomain
@testable import MoviesDomain

var moviesDetailsModelSuccessMock = MoviesDetailsResponse(
    genres: [
        .init(id: 1,
              name: "Action"),
        .init(id: 2,
              name: "Comedy"),
        .init(id: 3,
              name: "Drama"),
        .init(id: 4,
              name: "Romance"),
    ],
    backdropPath: "/path_to_movie_1_image.png",
    homepage: "movie_link",
    id: 1,
    imdbID: "12345",
    originalLanguage: "en",
    originalTitle: "Movie Name",
    overview: "Movie overview",
    posterPath: "/path_to_movie_1_image.png",
    releaseDate: "2024/01/12",
    runtime: 150,
    title: "Movie Name",
    video: false,
    voteAverage: 9.5,
    voteCount: 1231)
