//
//  MoviesListResponse+DTO.swift
//
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import CoreDomain
import Foundation
import MoviesDomain

extension MoviesListResponse: DecodableFromDTO {
    public struct DTO: Codable {
        let page: Int?
        let results: [MovieDTO]?
        let totalPages, totalResults: Int?

        enum CodingKeys: String, CodingKey {
            case page, results
            case totalPages = "total_pages"
            case totalResults = "total_results"
        }
    }

    public struct MovieDTO: Codable {
        let adult: Bool?
        let backdropPath: String?
        let genreIDS: [Int]?
        let id: Int?
        let originalLanguage: String?
        let originalTitle, overview: String?
        let popularity: Double?
        let posterPath, releaseDate, title: String?
        let video: Bool?
        let voteAverage: Double?
        let voteCount: Int?

        enum CodingKeys: String, CodingKey {
            case adult
            case backdropPath = "backdrop_path"
            case genreIDS = "genre_ids"
            case id
            case originalLanguage = "original_language"
            case originalTitle = "original_title"
            case overview, popularity
            case posterPath = "poster_path"
            case releaseDate = "release_date"
            case title, video
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
        }
    }

    public init(from dto: MoviesListResponse.DTO) {
        self = MoviesListResponse(page: dto.page,
                                  results: Self.map(dto: dto.results),
                                  totalPages: dto.totalPages,
                                  totalResults: dto.totalResults)
    }

    private static func map(dto: [MovieDTO]?) -> [Movie] {
        guard let dto = dto else { return [] }
        return dto.map {
            Movie(adult: $0.adult,
                  backdropPath: $0.backdropPath,
                  genreIDS: $0.genreIDS,
                  id: $0.id,
                  originalLanguage: $0.originalLanguage,
                  originalTitle: $0.originalTitle,
                  overview: $0.overview,
                  popularity: $0.popularity,
                  posterPath: $0.posterPath,
                  releaseDate: $0.releaseDate,
                  title: $0.title,
                  video: $0.video,
                  voteAverage: $0.voteAverage,
                  voteCount: $0.voteCount)
        }
    }
}
