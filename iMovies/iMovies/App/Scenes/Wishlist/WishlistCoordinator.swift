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
        WishListView()
            .navigationTitle("")
    }
}
