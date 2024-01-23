//
//  BannerRepoSuccessMock.swift
//
//
//  Created by Taha Mahmoud on 22/01/2024.
//

import Foundation
@testable import CoreDomain
@testable import MoviesDomain

struct BannerRepoSuccessMock: BannerRepoProtocol {
    func get() async -> Result<BannerResponse, MoviesError> {
        .success(bannerResponseMock)
    }
}
