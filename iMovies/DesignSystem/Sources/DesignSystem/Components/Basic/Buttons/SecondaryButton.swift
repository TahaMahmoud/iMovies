//
//  SecondaryButton.swift
//
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import Core
import SwiftUI

public struct SecondaryButton: View {
    public var icon: Image?
    public var title: String?
    public var action: Action

    public init(icon: Image? = nil,
                title: String? = nil,
                action: @escaping Action) {
        self.icon = icon
        self.title = title
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack {
                icon
                Text(title ?? "")
            }
            .frame(maxWidth: .infinity, minHeight: 48)
            .padding(.horizontal, 28)
            .padding(.vertical, 14)
            .background(DesignSystem.colors.secondary)
            .foregroundStyle(DesignSystem.colors.white)
            .font(Font.montserrat(weight: .semiBold, size: 16))
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

#Preview {
    SecondaryButton(icon: Image(systemName: "plus"),
                  title: "Wishlist") {
        print("")
    }
}