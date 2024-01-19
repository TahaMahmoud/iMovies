//
//  MoviesError.swift
//
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import CoreDomain
import MoviesDomain
import Networking

extension MoviesError: DecodableFromDTO {
    public struct DTO: Codable {
        public var message: String?

        enum CodingKeys: String, CodingKey {
            case message = "status_message"
        }
    }

    public init(from dto: DTO) {
        self = .error(message: dto.message ?? "")
    }
}
