//
//  CastResponse.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import Foundation

public struct CastResponse: Codable {
    let id: Int?
    let cast, crew: [Cast]?

    public init(id: Int?,
                cast: [Cast]?,
                crew: [Cast]?) {
        self.id = id
        self.cast = cast
        self.crew = crew
    }
}

public struct Cast: Codable {
    let adult: Bool?
    let gender, id: Int?
    let knownForDepartment: String?
    let name, originalName: String?
    let popularity: Double?
    let profilePath: String?
    let castID: Int?
    let character, creditID: String?
    let order: Int?
    let department: String?
    let job: String?

    public init(adult: Bool?,
                gender: Int?,
                id: Int?,
                knownForDepartment: String?,
                name: String?,
                originalName: String?,
                popularity: Double?,
                profilePath: String?,
                castID: Int?,
                character: String?,
                creditID: String?,
                order: Int?,
                department: String?,
                job: String?) {
        self.adult = adult
        self.gender = gender
        self.id = id
        self.knownForDepartment = knownForDepartment
        self.name = name
        self.originalName = originalName
        self.popularity = popularity
        self.profilePath = profilePath
        self.castID = castID
        self.character = character
        self.creditID = creditID
        self.order = order
        self.department = department
        self.job = job
    }
}
