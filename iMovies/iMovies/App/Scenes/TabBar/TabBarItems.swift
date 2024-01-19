//
//  TabBarItems.swift
//  iMovies
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import SwiftUI
import DesignSystem

enum TabBarItems: Int, CaseIterable {
    case home = 0
    case search
    case wishlist

    var title: String {
        switch self {
        case .home:
            return "Home"
        case .search:
            return "Search"
        case .wishlist:
            return "Wishlist"
        }
    }

    var iconName: String {
        switch self {
        case .home:
            return "ic_tab_home"
        case .search:
            return "ic_tab_search"
        case .wishlist:
            return "ic_tab_wishlist"
        }
    }

    var iconNameSelected: String {
        switch self {
        case .home:
            return "ic_tab_home_selected"
        case .search:
            return "ic_tab_search_selected"
        case .wishlist:
            return "ic_tab_wishlist_selected"
        }
    }
}
