//
//  HomeSectionView.swift
//  iMovies
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import SwiftUI
import DesignSystem

struct HomeSectionView: View {
    var viewModel: HomeSectionViewModel

    var body: some View {
        VStack {
            sectionTitle
            moviesView
        }
    }

    var sectionTitle: some View {
        HStack {
            Text(viewModel.category.title)
                .font(Font.montserrat(weight: .semiBold, size: 20))
                .foregroundStyle(DesignSystem.colors.white)
            Spacer()
            GhostButton(title: "See more", action: {
                viewModel.seeMorePressed(viewModel.category)
            })
            .padding(.trailing, 24)
        }
    }

    var moviesView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 25) {
                ForEach(viewModel.moviesList, id: \.id) { movie in
                    ShortMovieItemView(imageURL: movie.posterURL,
                                       name: movie.name,
                                       rating: movie.rating)
                }
            }
        }
    }
}

#Preview {
    HomeSectionView(viewModel: .init(category: .nowPlaying,
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
          })
                    .background(Color.black)
}

#Preview {
    HomeSectionView(viewModel: .init(category: .popular,
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
                     })
    .background(Color.black)

}
