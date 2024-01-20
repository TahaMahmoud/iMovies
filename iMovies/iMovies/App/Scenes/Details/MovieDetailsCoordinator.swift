//
//  MovieDetailsCoordinator.swift
//  iMovies
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import SwiftUI
import Stinsen

final class MovieDetailsCoordinator: NavigationCoordinatable {
    var stack = NavigationStack(initial: \MovieDetailsCoordinator.start)

    public init(movieId: Int) {
        stack = NavigationStack(initial: \MovieDetailsCoordinator.start, movieId)
    }

    @Root var start = makeMovieDetails
    @ViewBuilder func makeMovieDetails(movieId: Int) -> some View {
        MovieDetailsView(
            viewModel: Container.movieDetailsViewModel(movieId: movieId)
        )
        .navigationBarBackButtonHidden()
    }
}
