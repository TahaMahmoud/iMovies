//
//  AppTheme.swift
//
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import Foundation

public enum AppTheme {
    case iMovies

    var designSystem: DesignSystemModel {
        switch self {
        case .iMovies:
            iMoviesDesignSystem
        }
    }

    var fontNames: [String] {
        switch self {
        case .iMovies:
            iMoviesFontNames()
        }
    }
}
