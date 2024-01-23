//
//  CategoryView.swift
//  iMovies
//
//  Created by Taha Mahmoud on 21/01/2024.
//

import DesignSystem
import SwiftUI

struct CategoryView: View {
    @ObservedObject var viewModel: CategoryViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        ContentView(source: viewModel) { movies in
            VStack {
                header
                moviesView(movies: movies)
                Spacer()
            }
        } failureContent: {
            failureState
                .background(DesignSystem.colors.black)
        } emptyContent: {
            emptyState
                .background(DesignSystem.colors.black)
        }
        .onAppear {
            viewModel.getMovies.send()
        }
    }

    var emptyState: some View {
        VStack {
            Spacer()
            EmptyView(icon: Image(.icEmptyContent),
                      title: "we are sorry, we can not find any movies :(",
                      titleColor: DesignSystem.colors.white,
                      subTitle: "Find your movie by Type title, categories, years, etc",
                      subTitleColor: DesignSystem.colors.secondaryGray)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    var failureState: some View {
        VStack {
            EmptyView(icon: Image(.icEmptyContent),
                      title: "we are sorry, we can not find any movies :(",
                      titleColor: DesignSystem.colors.white,
                      subTitle: "Find your movie by Type title, categories, years, etc",
                      subTitleColor: DesignSystem.colors.secondaryGray)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    var header: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(DesignSystem.colors.white)
            })
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
                if !viewModel.isListFullLoaded {
                    activityIndicator
                }
            }
            .refreshable {
                viewModel.reload.send()
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
    CategoryView(viewModel: Container.categoryViewModel(input:
        CategoryViewModelInput(category: .nowPlaying,
                               categoryMoviesUseCase: Container.getNowPlayingUseCase)))
}
