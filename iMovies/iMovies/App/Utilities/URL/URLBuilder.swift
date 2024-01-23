//
//  URLBuilder.swift
//  iMovies
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import Foundation

struct URLBuilder {
    static func getFullPath(path: String?) -> String {
        APIConfig.imagesBaseURL + (path ?? "")
    }
}
