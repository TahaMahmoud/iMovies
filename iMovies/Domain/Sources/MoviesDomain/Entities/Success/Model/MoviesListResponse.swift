//
//  MoviesListResponse.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import Foundation

public struct MoviesListResponse: Codable {
    let page: Int?
    let results: [Movie]?
    let totalPages, totalResults: Int?

    public init(page: Int?,
                results: [Movie]?,
                totalPages: Int?,
                totalResults: Int?) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}

public struct Movie: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: String?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    public init(adult: Bool?,
                backdropPath: String?,
                genreIDS: [Int]?,
                id: Int?,
                originalLanguage: String?,
                originalTitle: String?,
                overview: String?,
                popularity: Double?,
                posterPath: String?,
                releaseDate: String?,
                title: String?,
                video: Bool?,
                voteAverage: Double?,
                voteCount: Int?) {
        self.adult = adult
        self.backdropPath = backdropPath
        self.genreIDS = genreIDS
        self.id = id
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}
