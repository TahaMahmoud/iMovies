//
//  BannerRepoFailedMock.swift
//
//
//  Created by Taha Mahmoud on 22/01/2024.
//

import Foundation
@testable import CoreDomain
@testable import MoviesDomain

struct BannerRepoFailedMock: BannerRepoProtocol {
    func get() async -> Result<BannerResponse, MoviesError> {
        .failure(.unknown)
    }
}
