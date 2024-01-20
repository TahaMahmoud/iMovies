//
//  MainTabBarView.swift
//
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import SwiftUI

public struct MainTabBarView: View {
    public let items: [any TabBarViewItem]
    @Binding public var activeTabIndex: Int
    @Namespace var animation

    public init(items: [any TabBarViewItem], activeTabIndex: Binding<Int>) {
        self.items = items
        _activeTabIndex = activeTabIndex
    }

    public var body: some View {
        ZStack {
            HStack(spacing: 20) {
                ForEach(items, id: \.id) { item in
                    Button(
                        action: {
                            item.customAction?()
                            guard item.id >= 0 else { return }
                            activeTabIndex = item.id
                        },
                        label: {
                            TabItemView(
                                icon: item.icon,
                                activeIcon: item.activeIcon,
                                text: item.text,
                                isActive: .init(
                                    get: { activeTabIndex == item.id },
                                    set: { _ in }
                                ),
                                animation: animation
                            )
                        }
                    )
                    .buttonStyle(.plain)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 20)
        }
        .animation(.default, value: activeTabIndex)
    }
}
