//
//  CastResponseSuccessMock.swift
//
//
//  Created by Taha Mahmoud on 22/01/2024.
//

@testable import CoreDomain
import Foundation
@testable import MoviesDomain

var castResponseSuccessMock = CastResponse(
    id: 1,
    cast: [
        .init(id: 1,
              name: "Cast 1",
              originalName: "Cast 1",
              profilePath: "/path_to_cast_1.png",
              castID: 1),
        .init(id: 2,
              name: "Cast 2",
              originalName: "Cast 2",
              profilePath: "/path_to_cast_2.png",
              castID: 2),
        .init(id: 3,
              name: "Cast 3",
              originalName: "Cast 3",
              profilePath: "/path_to_cast_3.png",
              castID: 3)
    ])
