//
//  MovieDetailsView.swift
//  iMovies
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import DesignSystem
import SwiftUI

struct MovieDetailsView: View {
    @State var selectedTab: MovieDetailsTab = .about

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                GeometryReader { geometry in
                    header(geometry: geometry)
                }
                .frame(height: 0.3 * UIScreen.main.bounds.height)

                Spacer()

                VStack {
                    movieName
                        .padding()

                    quickInfo
                    genres
                    tabsView
                        .padding()
                }
                .offset(y: 0.2 * UIScreen.main.bounds.height)
            }
        }
        .ignoresSafeArea()
        .background(DesignSystem.colors.black)
    }

    func header(geometry: GeometryProxy) -> some View {
        RemoteImage(url: "https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_FMjpg_UX1000_.jpg")
            .frame(width: geometry.size.width, height: geometry.size.height)
    }

    var movieName: some View {
        VStack(spacing: 15) {
            HStack {
                Text("Spiderman No Way Home")
                    .font(Font.montserrat(weight: .semiBold, size: 16))
                    .foregroundStyle(DesignSystem.colors.white)

                Spacer()

                Button(action: {}) {
                    Image(.icShare)
                }

                Button(action: {}) {
                    Image(.icSave)
                }
            }

            HStack {
                RatingView(rating: 9.6)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                    .background(DesignSystem.colors.secondary.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                Spacer()
            }
        }
    }

    var quickInfo: some View {
        HStack {
            HStack {
                Image(.icDateDetails)
                Text("2021")
                    .font(Font.montserrat(weight: .semiBold, size: 16))
                    .foregroundStyle(DesignSystem.colors.secondaryGray)
            }
            Rectangle()
                .frame(width: 1)
                .foregroundStyle(DesignSystem.colors.secondaryGray)
            HStack {
                Image(.icDurationDetails)
                Text("148 Minutes")
                    .font(Font.montserrat(weight: .semiBold, size: 16))
                    .foregroundStyle(DesignSystem.colors.secondaryGray)
            }
        }
    }

    var genres: some View {
        HStack {
            Image(.icGenreDetails)
            Text("Action, Drama, Romance")
                .font(Font.montserrat(weight: .semiBold, size: 16))
                .foregroundStyle(DesignSystem.colors.secondaryGray)
        }
    }

    var tabsView: some View {
        VStack(alignment: .leading, spacing: 25) {
            tabse

            switch selectedTab {
            case .about:
                movieDetails
            case .review:
                reviews
            case .cast:
                cast
            }
        }
        .frame(maxWidth: .infinity)
    }

    var tabse: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .firstTextBaseline, spacing: 25) {
                ForEach(MovieDetailsTab.allCases, id: \.id) { tab in
                    Button(action: {
                        selectedTab = tab
                    }) {
                        VStack(spacing: 16) {
                            Text(tab.title)
                                .font(Font.montserrat(weight: .semiBold, size: 16))
                                .foregroundStyle(DesignSystem.colors.white)

                            if selectedTab == tab {
                                Rectangle()
                                    .frame(height: 4)
                                    .foregroundStyle(DesignSystem.colors.darkGray)
                            }
                        }
                    }
                }
            }
        }
    }

    var movieDetails: some View {
        // swiftlint: disable line_length
        Text("From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.")
            .font(Font.montserrat(weight: .regular, size: 15))
            .foregroundStyle(DesignSystem.colors.white)
    }

    var reviews: some View {
        VStack(alignment: .leading, spacing: 12) {
            reviewView(name: "String", rating: 6.4, text: "String")
            reviewView(name: "String", rating: 6.4, text: "String")
            reviewView(name: "String", rating: 6.4, text: "String")
        }
    }

    func reviewView(name: String, rating: Double, text: String) -> some View {
        HStack(alignment: .top) {
            VStack(spacing: 20) {
                Image(.reviewer)
                    .resizable()
                    .frame(width: 44, height: 44)

                Text(rating.string())
                    .font(Font.montserrat(weight: .medium, size: 12))
                    .foregroundStyle(DesignSystem.colors.blue)
                    .padding(.bottom)
            }

            VStack(spacing: 10) {
                Text(name)
                    .font(Font.montserrat(weight: .medium, size: 12))
                    .foregroundStyle(DesignSystem.colors.white)

                Text(rating.string())
                    .font(Font.montserrat(weight: .regular, size: 12))
                    .foregroundStyle(DesignSystem.colors.white)
            }
        }
    }

    var cast: some View {
        LazyVGrid(columns: [GridItem(), GridItem()]) {
            castView(image: "https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_FMjpg_UX1000_.jpg", name: "String")
            castView(image: "https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_FMjpg_UX1000_.jpg", name: "String")
            castView(image: "https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_FMjpg_UX1000_.jpg", name: "String")
        }
    }

    func castView(image: String, name: String) -> some View {
        VStack(spacing: 10) {
            RemoteImage(url: image)
                .clipShape(Circle())
                .frame(width: 100, height: 100)
            Text(name)
                .font(Font.montserrat(weight: .regular, size: 12))
                .foregroundStyle(DesignSystem.colors.white)
        }
        .padding(.bottom)
    }
}

enum MovieDetailsTab: Int, CaseIterable, Identifiable {
    var id: Int { rawValue }

    case about = 0
    case review = 1
    case cast = 2

    var title: String {
        switch self {
        case .about:
            "About Movie"
        case .review:
            "Reviews"
        case .cast:
            "Cast"
        }
    }
}

#Preview {
    MovieDetailsView()
}
