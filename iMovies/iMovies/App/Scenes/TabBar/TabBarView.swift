//
//  TabBarView.swift
//  iMovies
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import DesignSystem
import SwiftUI

struct TabBarView: View {
    @State var selectedTab = 0

    init() {
        UITabBar.appearance().backgroundColor = .black
        UITabBar.appearance().isTranslucent = false
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(0)

                SearchView()
                    .tag(1)

                WishListView()
                    .tag(2)
            }

            ZStack {
                HStack(spacing: 20) {
                    ForEach(TabBarItems.allCases, id: \.self) { item in
                        Button {
                            selectedTab = item.rawValue
                        } label: {
                            TabBarItem(imageName: item.iconName,
                                       imageNameSelected: item.iconNameSelected,
                                       isActive: selectedTab == item.rawValue,
                                       title: item.title)
                            .padding(.horizontal, 20)
                        }
                    }
                }
                .padding(.horizontal, 15)
            }
        }
    }
}

struct TabBarItem: View {
    var imageName: String
    var imageNameSelected: String
    var isActive: Bool
    var title: String

    var body: some View {
        VStack(spacing: 4) {
            Spacer()
            Image(isActive ? imageNameSelected : imageName)
                .resizable()
                .renderingMode(.original)
                .frame(width: 20, height: 20)
            Text(title)
                .font(Font.montserrat(weight: .semiBold, size: 10))
                .fontWeight(.bold)
                .foregroundColor(isActive ? DesignSystem.colors.primary : DesignSystem.colors.white)
        }
    }
}

#Preview {
    TabBarView()
}
