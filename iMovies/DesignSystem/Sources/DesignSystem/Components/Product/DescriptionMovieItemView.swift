//
//  DescriptionMovieItemView.swift
//
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import SwiftUI

public struct DescriptionMovieItemViewModel {
    public var posterURL: String
    public var movieName: String
    public var rating: Double
    public var genre: [String]
    public var year: String

    public init(posterURL: String,
                movieName: String,
                rating: Double,
                genre: [String],
                year: String) {
        self.posterURL = posterURL
        self.movieName = movieName
        self.rating = rating
        self.genre = genre
        self.year = year
    }
}

public struct DescriptionMovieItemView: View {
    public var viewModel: DescriptionMovieItemViewModel

    public init(viewModel: DescriptionMovieItemViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        HStack(alignment: .top, spacing: 12) {
            moviePoster
            movieInfo
        }
        .padding()
    }

    var moviePoster: some View {
        RemoteImage(url: viewModel.posterURL,
                    placeholder: Image(.posterPlaceholder))
            .frame(width: 95, height: 120)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    var movieInfo: some View {
        VStack(alignment: .leading) {
            Text(viewModel.movieName)
                .font(Font.montserrat(weight: .regular, size: 16))
                .foregroundStyle(DesignSystem.colors.white)
                .lineLimit(1)
            VStack(alignment: .leading, spacing: 4) {
                RatingView(rating: viewModel.rating)
                HStack(spacing: 4) {
                    Image(.icGenre)
                    Text(viewModel.genre.joined(separator: ", "))
                        .foregroundStyle(DesignSystem.colors.white)
                        .font(Font.montserrat(weight: .regular, size: 16))
                }
                HStack(spacing: 4) {
                    Image(.icDate)
                    Text(viewModel.year)
                        .foregroundStyle(DesignSystem.colors.white)
                        .font(Font.montserrat(weight: .regular, size: 16))
                }
            }
            .padding(.top, 14)
            .padding(.trailing, 16)
        }
    }
}

#Preview {
    DescriptionMovieItemView(
        viewModel: .init(
            posterURL: "https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_FMjpg_UX1000_.jpg",
            movieName: "Spiderman Spiderman Spiderman",
            rating: 9.5,
            genre: ["Action", "Drama"],
            year: "2019"))
        .background(DesignSystem.colors.black)
}
