//
//  CategoryView.swift
//  iMovies
//
//  Created by Taha Mahmoud on 21/01/2024.
//

import DesignSystem
import SwiftUI

struct CategoryView: View {
    var viewModel: CategoryViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        ContentView(source: viewModel) { movies in
            VStack {
                header
                moviesView(movies: movies)
                Spacer()
            }
        } failureContent: {
            emptyState
        } emptyContent: {
            failureState
        }
        .background(DesignSystem.colors.black)
        .onAppear {
            viewModel.getMovies.send()
        }
    }

    var emptyState: some View {
        VStack {
        }
    }

    var failureState: some View {
        VStack {
        }
    }

    var header: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundStyle(DesignSystem.colors.white)
            }
            Spacer()
            Text(viewModel.category.title)
                .font(Font.montserrat(weight: .semiBold, size: 20))
                .foregroundStyle(DesignSystem.colors.white)
            Spacer()
        }
        .padding()
        .padding(.top, 10)
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
            }

            if !viewModel.isListFullLoaded {
                activityIndicator
            }
        }
        .refreshable {
            viewModel.reload.send()
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
    CategoryView(viewModel: Container.categoryViewModel(category: .nowPlaying))
}
