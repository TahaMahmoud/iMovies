//
//  HighlightsMoviesView.swift
//  iMovies
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import Core
import DesignSystem
import SwiftUI

struct HighlightsMoviesView: View {
    @State var movies: [HighlightsMovie]

    var body: some View {
        TabView {
            ForEach(movies, id: \.id) { movie in
                HighlightsMovieView(poster: movie.posterURL,
                                    isAddedToWishlist: movie.isAddedToWishlist,
                                    didPressDetails: movie.didPressDetails,
                                    didPressWishlist: movie.didPressWishlist)
            }
        }
        .foregroundStyle(.white)
        .tabViewStyle(.page)
    }
}

struct HighlightsMovieView: View {
    var poster: String

    @State var isAddedToWishlist: Bool
    var didPressDetails: Action
    var didPressWishlist: Action
    var body: some View {
        ZStack(alignment: .bottom) {
            GeometryReader { geometry in
                RemoteImage(url: poster)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .aspectRatio(contentMode: .fill)
                ImageGradient()
            }

            VStack {
                Spacer()
                HStack(spacing: 16) {
                    if isAddedToWishlist {
                        DangorButton(icon: Image(systemName: "trash"),
                                     title: "Remove",
                                     action: {
                            isAddedToWishlist = false
                            didPressWishlist()
                        })
                    } else {
                        SecondaryButton(icon: Image(systemName: "plus"),
                                        title: "Wishlist",
                                        action: {
                            isAddedToWishlist = true
                            didPressWishlist()
                        })
                    }
                    PrimaryButton(title: "Details", action: didPressDetails)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    HighlightsMoviesView(movies: [
        .init(posterURL: "https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_FMjpg_UX1000_.jpg",
              isAddedToWishlist: false,
              didPressDetails: {},
              didPressWishlist: {}),
        .init(posterURL: "https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_FMjpg_UX1000_.jpg",
              isAddedToWishlist: true,
              didPressDetails: {},
              didPressWishlist: {}),
        .init(posterURL: "https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_FMjpg_UX1000_.jpg",
              isAddedToWishlist: false,
              didPressDetails: {},
              didPressWishlist: {})
    ])
    .frame(height: 450)
}
