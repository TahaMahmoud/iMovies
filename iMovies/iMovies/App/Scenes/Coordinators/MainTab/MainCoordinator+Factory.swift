//
//  MainCoordinator+Factory.swift
//  iMovies
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import SwiftUI
import Stinsen
import DesignSystem

extension MainTabCoordinator {
    @ViewBuilder func makeEmptyTab(isActive: Bool) -> some View {
        EmptyView()
    }

    func makeHome() -> NavigationViewCoordinator<HomeCoordinator> {
        NavigationViewCoordinator(HomeCoordinator())
    }

    func makeSearch() -> NavigationViewCoordinator<SearchCoordinator> {
        NavigationViewCoordinator(SearchCoordinator())
    }

    func makeWishlist() -> NavigationViewCoordinator<WishlistCoordinator> {
        NavigationViewCoordinator(WishlistCoordinator())
    }
}
