//
//  APIConfig.swift
//  iMovies
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import Foundation
import ConfigData

struct APIConfig: ApiConfigProtocol {

    static var language: String {
        return "en-US"
    }

    static var baseURL: URL {
        let baseURLString = "https://api.themoviedb.org"
        let baseURL = URL(string: baseURLString)
        return baseURL ?? URL(string: "")!
    }

    static var apiVersion: String {
        return "3"
    }
    // swiftlint: disable line_length
    static var apiKey: String {
        return "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5MDAxNzMzNDZlYjFhYzJjZGE2MTM5NGQ0MjE0NDZhNCIsInN1YiI6IjVkNzVlMzRkNTI5NGU3MDAwZGY0ZGMzMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.IJq-1kmxuzAtror4LiXSBDd7BY6cHLUJBfueZS1QXfE"
    }
    // swiftlint: enable line_length
}
