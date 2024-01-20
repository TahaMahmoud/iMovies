//
//  ShortMovieItemView.swift
//
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import SwiftUI

public struct ShortMovieItemView: View {
    public var imageURL: String
    public var name: String?
    public var rating: Double?

    public init(imageURL: String,
                name: String? = nil,
                rating: Double? = nil) {
        self.imageURL = imageURL
        self.name = name
        self.rating = rating
    }

    public var body: some View {
        ZStack(alignment: .bottom) {
            moviePoster
                .frame(width: 120, height: 200)
            ImageGradient()
            movieInfo
        }
        .frame(width: 120, height: 200)
    }

    var moviePoster: some View {
        RemoteImage(url: imageURL)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }

    var movieInfo: some View {
        HStack {
            if let name = name, !name.isEmpty {
                Text(name)
                    .font(Font.montserrat(weight: .semiBold, size: 10))
                    .foregroundStyle(DesignSystem.colors.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
            Spacer()
            if let rating = rating, rating != 0 {
                RatingView(rating: rating)
            }
        }
        .padding(12)
    }
}

#Preview {
    ShortMovieItemView(imageURL: "https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_FMjpg_UX1000_.jpg",
                       name: "Spiderman",
                       rating: 4.3)
        .background(DesignSystem.colors.black)
}
