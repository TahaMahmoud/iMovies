//
//  MoviesListModelSuccessMock.swift
//
//
//  Created by Taha Mahmoud on 22/01/2024.
//

@testable import CoreDomain
import Foundation
@testable import MoviesDomain

var moviesListModelSuccessMock = MoviesListResponse(
    page: 1,
    results: [
        .init(genreIDS: [1, 2, 3],
              id: 1,
              originalLanguage: "en",
              originalTitle: "Movie 1 Name",
              overview: "Movie 1 Overview",
              posterPath: "/path_to_movie_1_image.png",
              releaseDate: "2024/01/12",
              title: "Movie 1 Name",
              video: false,
              voteAverage: 9.5,
              voteCount: 1200),
        .init(genreIDS: [1, 2, 3],
              id: 2,
              originalLanguage: "en",
              originalTitle: "Movie 2 Name",
              overview: "Movie 2 Overview",
              posterPath: "/path_to_movie_2_image.png",
              releaseDate: "2024/01/12",
              title: "Movie 2 Name",
              video: false,
              voteAverage: 9.5,
              voteCount: 1200),
        .init(genreIDS: [1, 2, 3],
              id: 3,
              originalLanguage: "en",
              originalTitle: "Movie 3 Name",
              overview: "Movie 3 Overview",
              posterPath: "/path_to_movie_3_image.png",
              releaseDate: "2024/01/12",
              title: "Movie 3 Name",
              video: false,
              voteAverage: 9.5,
              voteCount: 1200),
        .init(genreIDS: [1, 2, 3],
              id: 4,
              originalLanguage: "en",
              originalTitle: "Movie 4 Name",
              overview: "Movie 4 Overview",
              posterPath: "/path_to_movie_4_image.png",
              releaseDate: "2024/01/12",
              title: "Movie 4 Name",
              video: false,
              voteAverage: 9.5,
              voteCount: 1200),
        .init(genreIDS: [1, 2, 3],
              id: 5,
              originalLanguage: "en",
              originalTitle: "Movie 5 Name",
              overview: "Movie 5 Overview",
              posterPath: "/path_to_movie_5_image.png",
              releaseDate: "2024/01/12",
              title: "Movie 5 Name",
              video: false,
              voteAverage: 9.5,
              voteCount: 1200)
    ],
    totalPages: 5,
    totalResults: 100)
