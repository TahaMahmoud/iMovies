//
//  HomeSectionViewModel.swift
//  iMovies
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import Foundation

struct HomeSectionViewModel {
    var category: MovieCategory
    var moviesList: [HomeMovieItemViewModel]
    var seeMorePressed: (MovieCategory) -> Void
}

struct HomeMovieItemViewModel: Identifiable {
    var id = UUID()
    var posterURL: String
    var name: String
    var rating: Double
}
