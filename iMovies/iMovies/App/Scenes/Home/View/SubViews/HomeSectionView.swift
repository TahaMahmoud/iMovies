//
//  HomeSectionView.swift
//  iMovies
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import SwiftUI
import DesignSystem

struct HomeMovieItemViewModel: Identifiable {
    var id = UUID()
    var posterURL: String
    var name: String
    var rating: Double
}

internal enum MovieCategory {
    case nowPlaying
    case popular
    case topRated
    case upcoming

    var title: String {
        switch self {
        case .nowPlaying:
            "Now Playing"
        case .popular:
            "Popular"
        case .topRated:
            "Top Rated"
        case .upcoming:
            "Upcoming"
        }
    }
}

struct HomeSectionView: View {
    var category: MovieCategory
    var moviesList: [HomeMovieItemViewModel]
    var seeMorePressed: (MovieCategory) -> Void

    var body: some View {
        VStack {
            sectionTitle
            moviesView
        }
    }

    var sectionTitle: some View {
        HStack {
            Text(category.title)
                .font(Font.montserrat(weight: .semiBold, size: 20))
                .foregroundStyle(DesignSystem.colors.white)
            Spacer()
            GhostButton(title: "See more", action: {
                seeMorePressed(category)
            })
            .padding(.trailing, 24)
        }
    }

    var moviesView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 25) {
                ForEach(moviesList, id: \.id) { movie in
                    ShortMovieItemView(imageURL: movie.posterURL,
                                       name: movie.name,
                                       rating: movie.rating)
                }
            }
        }
    }
}

#Preview {
    HomeSectionView(category: .nowPlaying,
                    moviesList: [
                        .init(posterURL: "https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_FMjpg_UX1000_.jpg",
                              name: "Movie Name",
                              rating: 9.5),
                        .init(posterURL: "https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_FMjpg_UX1000_.jpg",
                              name: "Movie Name",
                              rating: 9.5),
                        .init(posterURL: "https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_FMjpg_UX1000_.jpg",
                              name: "Movie Name",
                              rating: 9.5),
                        .init(posterURL: "https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_FMjpg_UX1000_.jpg",
                              name: "Movie Name",
                              rating: 9.5),
                        .init(posterURL: "https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_FMjpg_UX1000_.jpg",
                              name: "Movie Name",
                              rating: 9.5)

                    ]) { _ in
    }
                    .background(Color.black)
}

#Preview {
    HomeSectionView(category: .popular,
                    moviesList: [
                        .init(posterURL: "https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_FMjpg_UX1000_.jpg",
                              name: "Movie Name",
                              rating: 9.5),
                        .init(posterURL: "https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_FMjpg_UX1000_.jpg",
                              name: "Movie Name",
                              rating: 9.5),
                        .init(posterURL: "https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_FMjpg_UX1000_.jpg",
                              name: "Movie Name",
                              rating: 9.5),
                        .init(posterURL: "https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_FMjpg_UX1000_.jpg",
                              name: "Movie Name",
                              rating: 9.5),
                        .init(posterURL: "https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_FMjpg_UX1000_.jpg",
                              name: "Movie Name",
                              rating: 9.5)

                    ], seeMorePressed: { _ in
                    })
    .background(Color.black)

}
