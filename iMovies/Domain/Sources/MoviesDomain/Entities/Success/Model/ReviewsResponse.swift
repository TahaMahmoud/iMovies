//
//  ReviewsResponse.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import Foundation

public struct ReviewsResponse: Codable {
    let id, page: Int?
    let results: [Review]?
    let totalPages, totalResults: Int?

    public init(id: Int?,
                page: Int?,
                results: [Review]?,
                totalPages: Int?,
                totalResults: Int?) {
        self.id = id
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}

public struct Review: Codable {
    let author: String?
    let authorDetails: AuthorDetails?
    let content, createdAt, id, updatedAt: String?
    let url: String?

    public init(author: String?,
                authorDetails: AuthorDetails?,
                content: String?,
                createdAt: String?,
                id: String?,
                updatedAt: String?,
                url: String?) {
        self.author = author
        self.authorDetails = authorDetails
        self.content = content
        self.createdAt = createdAt
        self.id = id
        self.updatedAt = updatedAt
        self.url = url
    }
}

public struct AuthorDetails: Codable {
    let name, username, avatarPath: String?
    let rating: Double?

    public init(name: String?,
                username: String?,
                avatarPath: String?,
                rating: Double?) {
        self.name = name
        self.username = username
        self.avatarPath = avatarPath
        self.rating = rating
    }
}
