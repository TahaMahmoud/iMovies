//
//  MovieCategory.swift
//  iMovies
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import Foundation

internal enum MovieCategory {
    case nowPlaying
    case popular
    case topRated
    case upcoming

    var title: String {
        switch self {
        case .nowPlaying:
            "Now Playing"
        case .popular:
            "Popular"
        case .topRated:
            "Top Rated"
        case .upcoming:
            "Upcoming"
        }
    }
}
