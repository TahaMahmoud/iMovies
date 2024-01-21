//
//  WishlistCoordinator.swift
//  iMovies
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import SwiftUI
import Stinsen

final class WishlistCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \WishlistCoordinator.start)

    @Root var start = makeWishlist
    @ViewBuilder func makeWishlist() -> some View {
        WishListView(viewModel: Container.wishListViewModel)
            .navigationTitle("")
    }

    @Route(.push) var movieDetails = makeMovieDetails
    @ViewBuilder private func makeMovieDetails(movieId: Int) -> some View {
        MovieDetailsCoordinator(movieId: movieId).view()
    }
}
