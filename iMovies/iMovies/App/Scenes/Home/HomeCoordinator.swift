//
//  HomeCoordinator.swift
//  iMovies
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import Stinsen
import SwiftUI

final class HomeCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \HomeCoordinator.start)

    @Root var start = makeHome
    @ViewBuilder func makeHome() -> some View {
        HomeView(viewModel: Container.homeViewModel)
    }

    @Route(.push) var movieDetails = makePDP
    @ViewBuilder private func makePDP(movieId: Int) -> some View {
        MovieDetailsCoordinator(movieId: movieId).view()
    }

    @Route(.push) var category = makeCategory
    @ViewBuilder private func makeCategory(input: CategoryViewModelInput) -> some View {
        CategoryCoordinator(input: input).view()
    }
}
