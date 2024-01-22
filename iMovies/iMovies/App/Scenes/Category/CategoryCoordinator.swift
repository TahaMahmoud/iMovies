//
//  CategoryCoordinator.swift
//  iMovies
//
//  Created by Taha Mahmoud on 21/01/2024.
//

import Stinsen
import SwiftUI

final class CategoryCoordinator: NavigationCoordinatable {
    var stack = NavigationStack(initial: \CategoryCoordinator.start)

    public init(input: CategoryViewModelInput) {
        stack = NavigationStack(initial: \CategoryCoordinator.start, input)
    }

    @Root var start = makeCategory
    @ViewBuilder func makeCategory(input: CategoryViewModelInput) -> some View {
        CategoryView(viewModel: Container.categoryViewModel(input: input))
        .navigationBarBackButtonHidden()
    }

    @Route(.push) var movieDetails = makeMovieDetails
    @ViewBuilder private func makeMovieDetails(movieId: Int) -> some View {
        MovieDetailsCoordinator(movieId: movieId).view()
    }
}
