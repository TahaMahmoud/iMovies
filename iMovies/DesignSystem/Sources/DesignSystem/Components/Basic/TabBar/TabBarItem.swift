//
//  TabBarItem.swift
//
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import SwiftUI

public struct TabItemView: View {
    public let icon: String
    public let activeIcon: String
    public let text: String
    @Binding public var isActive: Bool
    public var animation: Namespace.ID

    public init(icon: String,
                activeIcon: String,
                text: String,
                isActive: Binding<Bool>,
                animation: Namespace.ID) {
        self.icon = icon
        self.activeIcon = activeIcon
        self.text = text
        _isActive = isActive
        self.animation = animation
    }

    public var body: some View {
        VStack(spacing: 4) {
            Spacer()
            Image(isActive ? activeIcon : icon)
                .resizable()
                .renderingMode(.original)
                .frame(width: 20, height: 20)
            Text(text)
                .font(Font.montserrat(weight: .semiBold, size: 10))
                .fontWeight(.bold)
                .foregroundColor(isActive ? DesignSystem.colors.primary : DesignSystem.colors.white)
        }
    }
}
