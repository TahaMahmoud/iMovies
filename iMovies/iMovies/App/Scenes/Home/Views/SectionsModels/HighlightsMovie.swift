//
//  HighlightsMovie.swift
//  iMovies
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import Foundation
import Core

struct HighlightsMovie: Identifiable {
    var id = UUID()
    var posterURL: String
    var isAddedToWishlist: Bool
    var didPressDetails: Action
    var didPressWishlist: Action
}
