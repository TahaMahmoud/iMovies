//
//  MovieItemViewModel.swift
//  iMovies
//
//  Created by Taha Mahmoud on 21/01/2024.
//

import Foundation

struct MovieItemViewModel: Identifiable {
    let id: Int
    let name: String
    let rate: Double
    let genres: [String]
    let year: String
    let poster: String
}
