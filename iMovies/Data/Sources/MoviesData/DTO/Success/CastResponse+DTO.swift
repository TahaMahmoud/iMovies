//
//  CastResponse+DTO.swift
//
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import CoreDomain
import Foundation
import MoviesDomain

extension CastResponse: DecodableFromDTO {
    public struct DTO: Codable {
        let id: Int?
        let cast, crew: [CastDTO]?
    }

    public struct CastDTO: Codable {
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

        enum CodingKeys: String, CodingKey {
            case adult, gender, id
            case knownForDepartment = "known_for_department"
            case name
            case originalName = "original_name"
            case popularity
            case profilePath = "profile_path"
            case castID = "cast_id"
            case character
            case creditID = "credit_id"
            case order, department, job
        }
    }

    public init(from dto: CastResponse.DTO) {
        self = CastResponse(id: dto.id,
                            cast: Self.map(dto: dto.cast))
    }

    private static func map(dto: [CastDTO]?) -> [Cast] {
        guard let dto = dto else { return [] }
        return dto.map {
            Cast(id: $0.id,
                 name: $0.name,
                 originalName: $0.originalName,
                 profilePath: $0.profilePath,
                 castID: $0.castID)
        }
    }
}
