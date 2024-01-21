//
//  MovieDetailsModel.swift
//  iMovies
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import Foundation

struct MovieDetailsModel {
    var info: MovieInfoModel
    var reviews: [MovieReviewModel]
    var cast: [MovieCastModel]
}

struct MovieInfoModel {
    var cover: String
    var name: String
    var rating: Double
    var year: String
    var duration: Int
    var genres: [String]
    var details: String
    var url: String
}

struct MovieReviewModel: Identifiable {
    var id = UUID()
    var reviewerName: String
    var rating: Double
    var review: String
    var avatar: String
}

struct MovieCastModel: Identifiable {
    var id = UUID()
    var name: String
    var picture: String
}
