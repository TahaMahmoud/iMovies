//
//  HomeSectionViewModel.swift
//  iMovies
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import Foundation

struct HomeSectionViewModel: Identifiable {
    var id = UUID()
    var category: MovieCategory
    var moviesList: [HomeMovieItemViewModel]
    var seeMorePressed: (MovieCategory) -> Void
}

struct HomeMovieItemViewModel: Identifiable {
    var id: Int
    var posterURL: String
    var name: String
    var rating: Double
    var didPressOnDetails: (Int) -> Void
}
