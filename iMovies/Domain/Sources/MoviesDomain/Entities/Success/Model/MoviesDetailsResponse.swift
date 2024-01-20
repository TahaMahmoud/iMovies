//
//  MoviesDetailsResponse.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import Foundation

public struct MoviesDetailsResponse: Codable {
    public let genres: [Genre]?
    public let backdropPath: String?
    public let homepage: String?
    public let id: Int?
    public let imdbID, originalLanguage, originalTitle, overview: String?
    public let posterPath: String?
    public let releaseDate: String?
    public let runtime: Int?
    public let title: String?
    public let video: Bool?
    public let voteAverage: Double?
    public let voteCount: Int?

    public init(genres: [Genre]?,
                backdropPath: String?,
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
        self.backdropPath = backdropPath
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
    public  let id: Int?
    public let name: String?

    public init(id: Int?,
                name: String?) {
        self.id = id
        self.name = name
    }
}
