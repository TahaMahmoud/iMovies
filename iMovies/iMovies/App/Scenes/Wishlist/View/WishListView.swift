//
//  WishListView.swift
//  iMovies
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import DesignSystem
import SwiftUI

struct WishListView: View {
    @ObservedObject var viewModel: WishlistViewModel

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
            viewModel.viewDidLoad.send()
        }
    }

    var emptyState: some View {
        VStack {
        }
        .background(DesignSystem.colors.black)
    }

    var failureState: some View {
        VStack {
        }
        .background(DesignSystem.colors.black)
    }

    var header: some View {
        HStack {
            Text("Wishlist")
                .font(Font.montserrat(weight: .semiBold, size: 20))
                .foregroundStyle(DesignSystem.colors.white)
        }
        .padding()
        .padding(.top, 10)
    }

    func moviesView(movies: [MovieItemViewModel]) -> some View {
        NavigationStack {
            List {
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
                    .listRowBackground(DesignSystem.colors.black)
                }
                .onDelete { indexSet in
                    viewModel.removeMovie.send(indexSet.first ?? 0)
                }
            }
            .background(DesignSystem.colors.black)
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    WishListView(viewModel: Container.wishListViewModel)
}
