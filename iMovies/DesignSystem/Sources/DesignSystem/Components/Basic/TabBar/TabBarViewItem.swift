//
//  TabBarViewItem.swift
//
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import Foundation

public protocol TabBarViewItem: Identifiable {
    var id: Int { get }
    var icon: String { get }
    var activeIcon: String { get }
    var text: String { get }
    var customAction: (() -> Void)? { get }
}
