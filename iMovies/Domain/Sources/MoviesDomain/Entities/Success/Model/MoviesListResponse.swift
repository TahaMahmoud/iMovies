//
//  MoviesListResponse.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import Foundation

public struct MoviesListResponse: Codable {
    public let page: Int?
    public let results: [Movie]?
    public let totalPages, totalResults: Int?

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
    public let genreIDS: [Int]?
    public let id: Int?
    public let originalLanguage: String?
    public let originalTitle, overview: String?
    public let posterPath, releaseDate, title: String?
    public let video: Bool?
    public let voteAverage: Double?
    public let voteCount: Int?

    public init(genreIDS: [Int]?,
                id: Int?,
                originalLanguage: String?,
                originalTitle: String?,
                overview: String?,
                posterPath: String?,
                releaseDate: String?,
                title: String?,
                video: Bool?,
                voteAverage: Double?,
                voteCount: Int?) {
        self.genreIDS = genreIDS
        self.id = id
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}
