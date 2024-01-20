//
//  MainCoordinator.swift
//  iMovies
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import Foundation
import Stinsen
import SwiftUI

final class MainCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \MainCoordinator.tab)
    func customize(_ view: AnyView) -> some View {
        view
            .transition(.slide)
            .onAppear {
                self.root(\.tab)
            }
    }

    @Root var tab = makeTab
    func makeTab() -> MainTabCoordinator {
        MainTabCoordinator()
    }
}
