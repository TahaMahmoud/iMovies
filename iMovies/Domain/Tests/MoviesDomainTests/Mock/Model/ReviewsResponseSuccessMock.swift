//
//  ReviewsResponseSuccessMock.swift
//
//
//  Created by Taha Mahmoud on 22/01/2024.
//

@testable import CoreDomain
import Foundation
@testable import MoviesDomain

var reviewsResponseSuccessMock = ReviewsResponse(
    id: 1,
    page: 1,
    results: [
        .init(author: "Author 1 Name",
              authorDetails: .init(name: "Author 1 Name",
                                   username: "author1",
                                   avatarPath: "/path_to_author_1.png",
                                   rating: 7),
              content: "Author 1 Review",
              createdAt: "2024/1/14",
              id: "1",
              updatedAt: "2024/1/14",
              url: "/path_to_author_1.png"),
        .init(author: "Author 2 Name",
              authorDetails: .init(name: "Author 2 Name",
                                   username: "author2",
                                   avatarPath: "/path_to_author_2.png",
                                   rating: 7),
              content: "Author 2 Review",
              createdAt: "2024/1/14",
              id: "2",
              updatedAt: "2024/1/14",
              url: "/path_to_author_2.png"),
        .init(author: "Author 3 Name",
              authorDetails: .init(name: "Author 3 Name",
                                   username: "author3",
                                   avatarPath: "/path_to_author_3.png",
                                   rating: 7),
              content: "Author 3 Review",
              createdAt: "2024/1/14",
              id: "3",
              updatedAt: "2024/1/14",
              url: "/path_to_author_3.png")
    ],
    totalPages: 5,
    totalResults: 100)
