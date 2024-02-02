//
//  EmptyView.swift
//
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import SwiftUI

public struct EmptyStateView: View {
    public var icon: Image?
    public var title: String?
    public var titleColor: Color = DesignSystem.colors.white
    public var subTitle: String?
    public var subTitleColor: Color = DesignSystem.colors.secondaryGray

    public init(icon: Image? = nil,
                title: String? = nil,
                titleColor: Color = DesignSystem.colors.white,
                subTitle: String? = nil,
                subTitleColor: Color = DesignSystem.colors.secondaryGray) {
        self.icon = icon
        self.title = title
        self.titleColor = titleColor
        self.subTitle = subTitle
        self.subTitleColor = subTitleColor
    }

    public var body: some View {
        VStack(alignment: .center) {
            if let icon = icon {
                icon
                    .resizable()
                    .frame(width: 76, height: 76)
            }
            if let title = title, !title.isEmpty {
                Text(title)
                    .font(Font.montserrat(weight: .semiBold, size: 16))
                    .foregroundStyle(titleColor)
                    .padding(.top, 23)
                    .multilineTextAlignment(.center)
            }
            if let subTitle = subTitle, !subTitle.isEmpty {
                Text(subTitle)
                    .foregroundStyle(subTitleColor)
                    .padding(.top, 8)
                    .multilineTextAlignment(.center)
            }
        }
        .padding(50)
    }
}

#Preview {
    EmptyStateView(icon: Image(systemName: "plus"),
              title: "we are sorry, we can not find any movies :(",
              subTitle: "Find your movie by Type title, categories, years, etc ")
    .background(DesignSystem.colors.black)
}
