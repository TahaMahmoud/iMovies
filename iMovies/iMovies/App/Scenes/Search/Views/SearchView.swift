//
//  SearchView.swift
//  iMovies
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import DesignSystem
import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel

    var body: some View {
        ContentView(source: viewModel) { movies in
            VStack {
                header
                search
                    .padding(.top, 40)
                moviesView(movies: movies)
                    .padding(.top, 15)
                Spacer()
            }
            .padding(.horizontal)
            .background(DesignSystem.colors.black)
        } failureContent: {
            failureState
                .background(DesignSystem.colors.black)
        } emptyContent: {
            emptyState
                .background(DesignSystem.colors.black)
        }
    }

    var emptyState: some View {
        VStack {
            header
            search
                .padding(.top, 20)

            EmptyView(icon: Image(.icEmptySearch),
                      title: "we are sorry, we can not find the movie :(",
                      titleColor: DesignSystem.colors.white,
                      subTitle: "Find your movie by Type title, categories, years, etc ",
                      subTitleColor: DesignSystem.colors.secondaryGray)
            Spacer()

        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    var failureState: some View {
        VStack {
            header
            search
                .padding(.top, 20)

            EmptyView(icon: Image(.icEmptySearch),
                      title: "we are sorry, we can not find any movies :(",
                      titleColor: DesignSystem.colors.white,
                      subTitle: "Find your movie by Type title, categories, years, etc",
                      subTitleColor: DesignSystem.colors.secondaryGray)

            Spacer()
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    var header: some View {
        HStack {
            Text("Search")
                .font(Font.montserrat(weight: .semiBold, size: 20))
                .foregroundStyle(DesignSystem.colors.white)
        }
        .padding()
        .padding(.top, 10)
    }

    var search: some View {
        SearchInput(text: $viewModel.searchText,
                    placeHolder: "Movie name",
                    didSearchPressed: viewModel.search.send)
    }

    func moviesView(movies: [MovieItemViewModel]) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(alignment: .leading) {
                ForEach(Array(movies.enumerated()), id: \.element.id) { index, movie in
                    DescriptionMovieItemView(viewModel: DescriptionMovieItemViewModel(
                        posterURL: movie.poster,
                        movieName: movie.name,
                        rating: movie.rate,
                        genre: movie.genres,
                        year: movie.year)
                    )
                    .onTapGesture {
                        viewModel.movieDetails.send(index)
                    }
                }
                if !viewModel.isListFullLoaded {
                    activityIndicator
                }
            }
        }
    }

    var activityIndicator: some View {
        HStack {
            Spacer()
            SpinnerView()
                .onAppear {
                    viewModel.didFinishScroll()
                }
            Spacer()
        }
    }
}

#Preview {
    SearchView(viewModel: Container.searchViewModel)
}
