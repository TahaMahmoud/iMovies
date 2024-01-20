//
//  MainTabCoordinator.swift
//  iMovies
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import SwiftUI
import Stinsen
import DesignSystem

final class MainTabCoordinator: TabCoordinatable {
    @ViewBuilder func customize(_ view: AnyView) -> some View {

        GeometryReader { _ in
            VStack(spacing: 0) {
                view

                MainTabBarView(
                    items: [
                        TabItem.home,
                        TabItem.search,
                        TabItem.wishlist
                    ],
                    activeTabIndex: .init(
                        get: { self.child.activeTab },
                        set: { self.child.activeTab = $0 }
                    )
                )
                .frame(height: 76)
            }

        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }

    var child = TabChild(startingItems: [
        \MainTabCoordinator.home,
         \.search,
         \.wishList
    ])

    @Route(tabItem: makeEmptyTab) var home = makeHome
    @Route(tabItem: makeEmptyTab) var search = makeSearch
    @Route(tabItem: makeEmptyTab) var wishList = makeWishlist
}
