//
//  BannerRepo.swift
//
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import CoreDomain
import Foundation
import MoviesDomain

public struct BannerRepo: BannerRepoProtocol {
    private let remoteDataSource: RemoteBannerDataSourceProtocol

    public init(remoteDataSource: RemoteBannerDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }

    public func get() async -> Result<MoviesDomain.BannerResponse, MoviesDomain.MoviesError> {
        await remoteDataSource.getBanner()
    }
}
