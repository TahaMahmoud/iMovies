//
//  MoviesDetailsResponse.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import Foundation

public struct MoviesDetailsResponse: Codable {
    let genres: [Genre]?
    let homepage: String?
    let id: Int?
    let imdbID, originalLanguage, originalTitle, overview: String?
    let posterPath: String?
    let releaseDate: String?
    let runtime: Int?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    public init(genres: [Genre]?,
                homepage: String?,
                id: Int?,
                imdbID: String?,
                originalLanguage: String?,
                originalTitle: String?,
                overview: String?,
                posterPath: String?,
                releaseDate: String?,
                runtime: Int?,
                title: String?,
                video: Bool?,
                voteAverage: Double?,
                voteCount: Int?) {
        self.genres = genres
        self.homepage = homepage
        self.id = id
        self.imdbID = imdbID
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.runtime = runtime
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}

public struct Genre: Codable {
    let id: Int?
    let name: String?

    public init(id: Int?,
                name: String?) {
        self.id = id
        self.name = name
    }
}
