//
//  MoviesDetailsResponse+DTO.swift
//
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import CoreDomain
import Foundation
import MoviesDomain

extension MoviesDetailsResponse: DecodableFromDTO {
    public struct DTO: Codable {
        public let adult: Bool?
        public let backdropPath: String?
        public let belongsToCollection: Bool?
        public let budget: Int?
        public let genres: [GenreDTO]?
        public let homepage: String?
        public let id: Int?
        public let imdbID, originalLanguage, originalTitle, overview: String?
        public let popularity: Double?
        public let posterPath: String?
        public let productionCompanies: [ProductionCompanyDTO]?
        public let productionCountries: [ProductionCountryDTO]?
        public let releaseDate: String?
        public let revenue, runtime: Int?
        public let spokenLanguages: [SpokenLanguageDTO]?
        public let status, tagline, title: String?
        public let video: Bool?
        public let voteAverage: Double?
        public let voteCount: Int?

        enum CodingKeys: String, CodingKey {
            case adult
            case backdropPath = "backdrop_path"
            case belongsToCollection = "belongs_to_collection"
            case budget, genres, homepage, id
            case imdbID = "imdb_id"
            case originalLanguage = "original_language"
            case originalTitle = "original_title"
            case overview, popularity
            case posterPath = "poster_path"
            case productionCompanies = "production_companies"
            case productionCountries = "production_countries"
            case releaseDate = "release_date"
            case revenue, runtime
            case spokenLanguages = "spoken_languages"
            case status, tagline, title, video
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
        }
    }

    public struct GenreDTO: Codable {
        public let id: Int?
        public let name: String?
    }

    public struct ProductionCompanyDTO: Codable {
        public let id: Int?
        public let logoPath, name, originCountry: String?

        enum CodingKeys: String, CodingKey {
            case id
            case logoPath = "logo_path"
            case name
            case originCountry = "origin_country"
        }
    }

    public struct ProductionCountryDTO: Codable {
        public let id, name: String?

        enum CodingKeys: String, CodingKey {
            case id = "iso_3166_1"
            case name
        }
    }

    public struct SpokenLanguageDTO: Codable {
        let englishName, id, name: String?

        enum CodingKeys: String, CodingKey {
            case englishName = "english_name"
            case id = "iso_639_1"
            case name
        }
    }

    public init(from dto: MoviesDetailsResponse.DTO) {
        self = MoviesDetailsResponse(adult: dto.adult,
                                     backdropPath: dto.backdropPath,
                                     belongsToCollection: dto.belongsToCollection,
                                     budget: dto.budget,
                                     genres: Self.map(dto: dto.genres),
                                     homepage: dto.homepage,
                                     id: dto.id,
                                     imdbID: dto.imdbID,
                                     originalLanguage: dto.originalLanguage,
                                     originalTitle: dto.originalTitle,
                                     overview: dto.overview,
                                     popularity: dto.popularity,
                                     posterPath: dto.posterPath,
                                     productionCompanies: Self.map(dto: dto.productionCompanies),
                                     productionCountries: Self.map(dto: dto.productionCountries),
                                     releaseDate: dto.releaseDate,
                                     revenue: dto.revenue,
                                     runtime: dto.runtime,
                                     spokenLanguages: Self.map(dto: dto.spokenLanguages),
                                     status: dto.status,
                                     tagline: dto.tagline,
                                     title: dto.title,
                                     video: dto.video,
                                     voteAverage: dto.voteAverage,
                                     voteCount: dto.voteCount)
    }

    private static func map(dto: [GenreDTO]?) -> [Genre]? {
        guard let dto = dto else { return [] }
        return dto.map {
            Genre(id: $0.id, name: $0.name)
        }
    }

    private static func map(dto: [ProductionCompanyDTO]?) -> [ProductionCompany]? {
        guard let dto = dto else { return [] }
        return dto.map {
            ProductionCompany(id: $0.id,
                              logoPath: $0.logoPath,
                              name: $0.name,
                              originCountry: $0.originCountry)
        }
    }

    private static func map(dto: [ProductionCountryDTO]?) -> [ProductionCountry]? {
        guard let dto = dto else { return [] }
        return dto.map {
            ProductionCountry(id: $0.id,
                              name: $0.name)
        }
    }

    private static func map(dto: [SpokenLanguageDTO]?) -> [SpokenLanguage]? {
        guard let dto = dto else { return [] }
        return dto.map {
            SpokenLanguage(englishName: $0.englishName,
                           id: $0.id,
                           name: $0.name)
        }
    }
}
