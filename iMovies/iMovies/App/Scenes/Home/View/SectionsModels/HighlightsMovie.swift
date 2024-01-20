//
//  HighlightsMovie.swift
//  iMovies
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import Foundation

struct HighlightsMovie: Identifiable {
    var id = UUID()
    var posterURL: String
    var isAddedToWishlist: Bool
    var didPressDetails: (Int) -> Void
    var didPressWishlist: (Int) -> Void
}
