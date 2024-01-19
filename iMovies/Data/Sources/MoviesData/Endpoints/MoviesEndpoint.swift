//
//  MoviesEndpoint.swift
//
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import ConfigData
import Foundation
import MoviesDomain
import Networking

enum MoviesEndpoint {
    case highlights
    case nowPlaying(page: Int)
    case popular(page: Int)
    case topRated(page: Int)
    case upcoming(page: Int)
    case movieDetails(id: Int)
    case cast(movieId: Int)
    case reviews(movieId: Int)
    case movies(query: String, page: Int)
}

extension MoviesEndpoint: RemoteEndpoint {
    var baseUrl: URL {
        apiConfig.baseURL
    }

    var apiVersion: String? {
        return apiConfig.apiVersion
    }

    var path: String {
        switch self {
        case .highlights:
            "movie/now_playing"
        case let .nowPlaying(page):
            "movie/now_playing"
        case let .popular(page):
            "movie/popular"
        case let .topRated(page):
            "movie/top_rated"
        case let .upcoming(page):
            "movie/upcoming"
        case let .movieDetails(id):
            "movie/\(id)"
        case let .cast(movieId):
            "movie/\(movieId)/credits"
        case let .reviews(movieId):
            "movie/\(movieId)/reviews"
        case let .movies(_, page):
            "search/movie"
        }
    }

    var httpMethod: HTTPMethod {
        .get
    }

    var headers: HTTPHeaders? {
        ["Authorization": apiConfig.apiKey]
    }

    var requestTask: RequestParameterTask {
        var param = NetworkHTTPParameters()
        param["language"] = apiConfig.language
        switch self {
        case let .nowPlaying(page):
            param["page"] = page
        case let .popular(page):
            param["page"] = page
        case let .topRated(page):
            param["page"] = page
        case let .upcoming(page):
            param["page"] = page
        case let .movies(query, page):
            param["query"] = query
            param["page"] = page
        default:
            break
        }

        return RequestParameterTask.requestParameters(parameters: param,
                                                      encoding: .query)
    }
}
