//
//  MoviePosterURLBuilder.swift
//  iMovies
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import Foundation

struct MoviePosterURLBuilder {
    static func getFullPosterURL(path: String?) -> String {
        "https://image.tmdb.org/t/p/w500\(path ?? ""))"
    }
}
