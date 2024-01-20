//
//  HomeCoordinator.swift
//  iMovies
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import SwiftUI
import Stinsen

final class HomeCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \HomeCoordinator.start)

    @Root var start = makeHome
    @ViewBuilder func makeHome() -> some View {
        HomeView()
            .navigationTitle("")
    }
}
