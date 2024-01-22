//
//  UIInitializer.swift
//  iMovies
//
//  Created by Taha Mahmoud on 22/01/2024.
//

import Foundation
import Core
import UIKit

struct UIInitializer: AppDelegateManagable {
    static var shared: AppDelegateManagable = UIInitializer()

    func setup() {
        UITabBar.appearance().isHidden = true
    }
}
