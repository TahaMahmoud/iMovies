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

    public init(category: MovieCategory) {
        stack = NavigationStack(initial: \CategoryCoordinator.start, category)
    }

    @Root var start = makeCategory
    @ViewBuilder func makeCategory(category: MovieCategory) -> some View {
        CategoryView(viewModel: Container.categoryViewModel(category: category))
        .navigationBarBackButtonHidden()
    }

    @Route(.push) var movieDetails = makePDP
    @ViewBuilder private func makePDP(movieId: Int) -> some View {
        MovieDetailsCoordinator(movieId: movieId).view()
    }
}
