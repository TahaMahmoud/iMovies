//
//  TabBarItems.swift
//  iMovies
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import SwiftUI
import DesignSystem

enum TabItem: Int, CaseIterable, Identifiable, TabBarViewItem {
    var id: Int { rawValue }

    case home = 0
    case search = 1
    case wishlist = 2

    var icon: String {
        switch self {
        case .home:
            "ic_tab_home"
        case .search:
            "ic_tab_search"
        case .wishlist:
            "ic_tab_wishlist"
        }
    }

    var activeIcon: String {
        switch self {
        case .home:
            "ic_tab_home_selected"
        case .search:
            "ic_tab_search_selected"
        case .wishlist:
            "ic_tab_wishlist_selected"
        }
    }

    var text: String {
        switch self {
        case .home:
            "Home"
        case .search:
            "Search"
        case .wishlist:
            "Wishlist"
        }
    }

    var customAction: (() -> Void)? {
        nil
    }
}
