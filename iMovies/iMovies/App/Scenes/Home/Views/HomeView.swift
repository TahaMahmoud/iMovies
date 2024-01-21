//
//  HomeView.swift
//  iMovies
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import CoreData
import DesignSystem
import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ContentView(source: viewModel) { homeSections in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 32) {
                    if !homeSections.highlights.isEmpty {
                        HighlightsMoviesView(movies: homeSections.highlights)
                            .frame(height: 450)
                            .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
                    }

                    ForEach(homeSections.sections, id: \.id) { section in
                        HomeSectionView(viewModel: section)
                            .padding(.horizontal, 24)
                    }

                    if !homeSections.banner.image.isEmpty ||
                        !homeSections.banner.title.isEmpty ||
                        !homeSections.banner.description.isEmpty {
                        BannerView(viewModel: homeSections.banner) {
                            URLUtility.openURL("https://www.themoviedb.org/")
                        }
                        .padding(.horizontal, 24)
                        .padding(.top, 20)
                    }
                }
            }
            .ignoresSafeArea()
        } failureContent: {
            failureState
                .background(DesignSystem.colors.black)
        } emptyContent: {
            emptyState
                .background(DesignSystem.colors.black)
        }
        .onAppear {
            viewModel.viewDidLoad.send()
        }
        .refreshable {
            viewModel.reload.send()
        }
    }

    var emptyState: some View {
        VStack {
            Spacer()
            EmptyView(icon: Image(.icEmptyContent),
                      title: "There is no movie yet!",
                      titleColor: DesignSystem.colors.white,
                      subTitle: "Start exploring movies and add them to your wishlist",
                      subTitleColor: DesignSystem.colors.secondaryGray)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    var failureState: some View {
        VStack {
            Spacer()
            EmptyView(icon: Image(.icEmptyContent),
                      title: "There is no movie yet!",
                      titleColor: DesignSystem.colors.white,
                      subTitle: "Start exploring movies and add them to your wishlist",
                      subTitleColor: DesignSystem.colors.secondaryGray)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    HomeView(viewModel: Container.homeViewModel)
}
