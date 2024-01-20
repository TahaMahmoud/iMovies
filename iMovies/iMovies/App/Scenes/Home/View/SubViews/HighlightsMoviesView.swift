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
    var movies: [HighlightsMovie]

    var body: some View {
        TabView {
            ForEach(movies, id: \.id) { movie in
                ZStack(alignment: .bottom) {
                    GeometryReader { geometry in
                        RemoteImage(url: movie.posterURL)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .aspectRatio(contentMode: .fill)
                        ImageGradient()
                    }

                    VStack {
                        Spacer()
                        HStack(spacing: 16) {
                            if movie.isAddedToWishlist {
                                DangorButton(icon: Image(systemName: "trash"),
                                             title: "Remove",
                                             action: {})
                            } else {
                                SecondaryButton(icon: Image(systemName: "plus"),
                                                title: "Wishlist",
                                                action: {})
                            }
                            PrimaryButton(title: "Details", action: {})
                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 50)
                    }
                }
            }
        }
        .foregroundStyle(.white)
        .tabViewStyle(.page)
        .background(.black)
    }
}

#Preview {
    HighlightsMoviesView(movies: [
        .init(posterURL: "https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_FMjpg_UX1000_.jpg",
              isAddedToWishlist: false,
              didPressDetails: { _ in},
              didPressWishlist: { _ in}),
        .init(posterURL: "https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_FMjpg_UX1000_.jpg",
              isAddedToWishlist: true,
              didPressDetails: { _ in},
              didPressWishlist: { _ in}),
        .init(posterURL: "https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_FMjpg_UX1000_.jpg",
              isAddedToWishlist: false,
              didPressDetails: { _ in},
              didPressWishlist: { _ in})
    ])
    .frame(height: 450)
}
