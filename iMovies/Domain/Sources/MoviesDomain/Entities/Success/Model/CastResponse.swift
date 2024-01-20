//
//  CastResponse.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import Foundation

public struct CastResponse: Codable {
    let id: Int?
    let cast: [Cast]?

    public init(id: Int?,
                cast: [Cast]?) {
        self.id = id
        self.cast = cast
    }
}

public struct Cast: Codable {
    let id: Int?
    let name, originalName: String?
    let profilePath: String?
    let castID: Int?

    public init(id: Int?,
                name: String?,
                originalName: String?,
                profilePath: String?,
                castID: Int?) {
        self.id = id
        self.name = name
        self.originalName = originalName
        self.profilePath = profilePath
        self.castID = castID
    }
}
