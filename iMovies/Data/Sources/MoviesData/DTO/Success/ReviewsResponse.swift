//
//  ReviewsResponse+DTO.swift
//
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import CoreDomain
import Foundation
import MoviesDomain

extension ReviewsResponse: DecodableFromDTO {
    public struct DTO: Codable {
        let id, page: Int?
        let results: [ReviewDTO]?
        let totalPages, totalResults: Int?
    }

    public struct ReviewDTO: Codable {
        let author: String?
        let authorDetails: AuthorDetailsDTO?
        let content, createdAt, id, updatedAt: String?
        let url: String?

        enum CodingKeys: String, CodingKey {
            case author
            case authorDetails = "author_details"
            case content
            case createdAt = "created_at"
            case id
            case updatedAt = "updated_at"
            case url
        }
    }

    public struct AuthorDetailsDTO: Codable {
        let name, username, avatarPath: String?
        let rating: Double?

        enum CodingKeys: String, CodingKey {
            case name, username
            case avatarPath = "avatar_path"
            case rating
        }
    }

    public init(from dto: ReviewsResponse.DTO) {
        self = ReviewsResponse(id: dto.id,
                               page: dto.page,
                               results: Self.map(dto: dto.results),
                               totalPages: dto.totalPages,
                               totalResults: dto.totalResults)
    }

    private static func map(dto: [ReviewDTO]?) -> [Review] {
        guard let dto = dto else { return [] }
        return dto.map {
            Review(author: $0.author,
                   authorDetails: AuthorDetails(name: $0.authorDetails?.name,
                                                username: $0.authorDetails?.username,
                                                avatarPath: $0.authorDetails?.avatarPath,
                                                rating: $0.authorDetails?.rating),
                   content: $0.content,
                   createdAt: $0.createdAt,
                   id: $0.id,
                   updatedAt: $0.updatedAt,
                   url: $0.url)
        }
    }
}
