//
//  WishListItem.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import Foundation

public protocol WishListItemProtocol {
    var movieId: Int { get set }
    var title: String { get set }
    var voteAverage: Double { get set }
    var genres: [Genre] { get set }
    var releaseDate: String { get set }
    var duration: Int? { get set }
    var poster: String { get set }
}

public struct WishListItemInput: WishListItemProtocol {
    public var movieId: Int
    public var title: String
    public var voteAverage: Double
    public var genres: [Genre]
    public var releaseDate: String
    public var duration: Int?
    public var poster: String

    public init(movieId: Int,
                title: String,
                voteAverage: Double,
                genres: [Genre],
                releaseDate: String,
                duration: Int? = nil,
                poster: String) {
        self.movieId = movieId
        self.title = title
        self.voteAverage = voteAverage
        self.genres = genres
        self.releaseDate = releaseDate
        self.duration = duration
        self.poster = poster
    }
}
