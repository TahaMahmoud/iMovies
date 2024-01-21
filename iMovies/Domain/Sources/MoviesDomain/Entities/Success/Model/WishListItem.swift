//
//  WishListItem.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import Foundation
import DataPersistence

public protocol WishListItemProtocol {
    var movieId: Int { get set }
    var title: String { get set }
    var voteAverage: Double { get set }
    var genres: [Int] { get set }
    var releaseDate: String { get set }
    var poster: String { get set }
}

public struct WishListItem: WishListItemProtocol, Cachable {
    public var movieId: Int
    public var title: String
    public var voteAverage: Double
    public var genres: [Int]
    public var releaseDate: String
    public var poster: String

    public init(movieId: Int,
                title: String,
                voteAverage: Double,
                genres: [Int],
                releaseDate: String,
                poster: String) {
        self.movieId = movieId
        self.title = title
        self.voteAverage = voteAverage
        self.genres = genres
        self.releaseDate = releaseDate
        self.poster = poster
    }
}
