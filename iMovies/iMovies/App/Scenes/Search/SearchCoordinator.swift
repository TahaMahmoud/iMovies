//
//  SearchCoordinator.swift
//  iMovies
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import SwiftUI
import Stinsen

final class SearchCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \SearchCoordinator.start)

    @Root var start = makeSearch
    @ViewBuilder func makeSearch() -> some View {
        SearchView()
            .navigationTitle("")
    }
}
