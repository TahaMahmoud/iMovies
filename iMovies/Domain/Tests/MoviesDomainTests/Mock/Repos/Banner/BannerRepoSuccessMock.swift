//
//  BannerRepoSuccessMock.swift
//
//
//  Created by Taha Mahmoud on 22/01/2024.
//

import Foundation

import Foundation
@testable import CoreDomain
@testable import MoviesDomain

class BannerRepoSuccessMock: BannerRepoProtocol {
    func get() async -> Result<BannerResponse, MoviesError> {
        .success(bannerResponseMock)
    }
}
