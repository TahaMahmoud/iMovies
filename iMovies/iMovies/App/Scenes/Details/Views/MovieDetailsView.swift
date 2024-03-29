//
//  MovieDetailsView.swift
//  iMovies
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import DesignSystem
import SwiftUI
import UIKit
import Core

struct MovieDetailsView: View {
    @ObservedObject var viewModel: MovieDetailsViewModel
    @State var selectedTab: MovieDetailsTab = .about
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        ContentView(source: viewModel) { movieDetails in
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    header(movieDetails: movieDetails)

                    Spacer()

                    VStack {
                        movieName(movieDetails: movieDetails)
                            .padding()

                        quickInfo(movieDetails: movieDetails)
                        genres(movieDetails: movieDetails)
                        tabsView(movieDetails: movieDetails)
                            .padding()
                    }
                }
            }
            .background(DesignSystem.colors.black)
            .ignoresSafeArea()
        } failureContent: {
            failureState
                .background(DesignSystem.colors.black)
        } emptyContent: {
            failureState
                .background(DesignSystem.colors.black)
        }
        .onAppear {
            viewModel.viewDidLoad.send()
        }
    }

    var emptyState: some View {
        VStack {
            Spacer()
            EmptyStateView(icon: Image(.icEmptyContent),
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
            Spacer()
            EmptyStateView(icon: Image(.icEmptyContent),
                      title: "we are sorry, we can not find any movies :(",
                      titleColor: DesignSystem.colors.white,
                      subTitle: "Find your movie by Type title, categories, years, etc",
                      subTitleColor: DesignSystem.colors.secondaryGray)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    func header(movieDetails: MovieDetailsModel) -> some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(DesignSystem.colors.white)
                })
                Spacer()
            }
            .padding()
            .padding(.top, 60)

            RemoteImage(url: movieDetails.info.cover,
                        placeholder: Image(.posterPlaceholder))
                .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
        }
    }

    func movieName(movieDetails: MovieDetailsModel) -> some View {
        VStack(spacing: 15) {
            HStack {
                Text(movieDetails.info.name)
                    .font(Font.montserrat(weight: .semiBold, size: 16))
                    .foregroundStyle(DesignSystem.colors.white)

                Spacer()

                Button(action: {
                    ShareUtility.shareSheet(items: ["""
                    Check out this amazing movie,\n(\(movieDetails.info.name))
                    \(movieDetails.info.url)
                    """])
                }, label: {
                    Image(.icShare)
                })

                Button(action: {
                    viewModel.wishlist.send()
                }, label: {
                    Image(viewModel.isInWishlist ? .icSaved : .icSave)
                })
            }

            HStack {
                RatingView(rating: movieDetails.info.rating)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                    .background(DesignSystem.colors.secondary.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                Spacer()
            }
        }
    }

    func quickInfo(movieDetails: MovieDetailsModel) -> some View {
        HStack {
            HStack {
                Image(.icDateDetails)
                Text(movieDetails.info.year)
                    .font(Font.montserrat(weight: .semiBold, size: 16))
                    .foregroundStyle(DesignSystem.colors.secondaryGray)
            }
            Rectangle()
                .frame(width: 1)
                .foregroundStyle(DesignSystem.colors.secondaryGray)
            HStack {
                Image(.icDurationDetails)
                Text("\(movieDetails.info.duration) Minutes")
                    .font(Font.montserrat(weight: .semiBold, size: 16))
                    .foregroundStyle(DesignSystem.colors.secondaryGray)
            }
        }
    }

    func genres(movieDetails: MovieDetailsModel) -> some View {
        HStack(alignment: .top) {
            Image(.icGenreDetails)
            Text(movieDetails.info.genres.joined(separator: ", "))
                .font(Font.montserrat(weight: .semiBold, size: 16))
                .foregroundStyle(DesignSystem.colors.secondaryGray)
                .multilineTextAlignment(.center)
        }
    }

    func tabsView(movieDetails: MovieDetailsModel) -> some View {
        VStack(alignment: .leading, spacing: 25) {
            tabse

            switch selectedTab {
            case .about:
                overview(movieDetails: movieDetails)
            case .review:
                reviews(movieDetails: movieDetails)
            case .cast:
                cast(movieDetails: movieDetails)
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
                    }, label: {
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
                    })
                }
            }
        }
    }

    func overview(movieDetails: MovieDetailsModel) -> some View {
        Text(movieDetails.info.details)
            .font(Font.montserrat(weight: .regular, size: 15))
            .foregroundStyle(DesignSystem.colors.white)
    }

    func reviews(movieDetails: MovieDetailsModel) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(movieDetails.reviews, id: \.id) { review in
                reviewView(avatar: review.avatar,
                           name: review.reviewerName,
                           rating: review.rating,
                           text: review.review)
            }
        }
    }

    func reviewView(avatar: String, name: String, rating: Double, text: String) -> some View {
        HStack(alignment: .top) {
            VStack(spacing: 20) {
                RemoteImage(url: avatar,
                            placeholder: Image(.reviewer))
                    .clipShape(Circle())
                    .frame(width: 44, height: 44)

                Text(rating.string())
                    .font(Font.montserrat(weight: .medium, size: 12))
                    .foregroundStyle(DesignSystem.colors.blue)
                    .padding(.bottom)
            }

            VStack(alignment: .leading, spacing: 10) {
                Text(name)
                    .font(Font.montserrat(weight: .medium, size: 12))
                    .foregroundStyle(DesignSystem.colors.white)
                    .multilineTextAlignment(.leading)

                Text(rating.string())
                    .font(Font.montserrat(weight: .regular, size: 12))
                    .foregroundStyle(DesignSystem.colors.white)
                    .multilineTextAlignment(.leading)
            }
        }
    }

    func cast(movieDetails: MovieDetailsModel) -> some View {
        LazyVGrid(columns: [GridItem(), GridItem()]) {
            ForEach(movieDetails.cast, id: \.id) { cast in
                castView(image: cast.picture, name: cast.name)
            }
        }
    }

    func castView(image: String, name: String) -> some View {
        VStack(spacing: 10) {
            RemoteImage(url: image,
                        placeholder: Image(.reviewer))
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
    MovieDetailsView(viewModel: Container.movieDetailsViewModel(movieId: 955916))
}
