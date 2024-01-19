//
//  DesignSystemConfigurator.swift
//  iMovies
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import Foundation
import DesignSystem
import Core

struct DesignSystemConfigurator: AppDelegateManagable {
    static var shared: AppDelegateManagable = DesignSystemConfigurator()

    func setup() {
        DesignSystem.shared.setupTheme(theme: .iMovies)
    }
}
