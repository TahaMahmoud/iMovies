//
//  RemoteBannerDataSource.swift
//
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import Foundation
import MoviesDomain
import Networking

public protocol RemoteBannerDataSourceProtocol {
    func getBanner() async -> Result<BannerResponse,
        MoviesError>
}

public struct RemoteBannerDataSource: RemoteBannerDataSourceProtocol {
    private let networkingManger: NetworkManagerProtocol

    public init(networkingManger: NetworkManagerProtocol) {
        self.networkingManger = networkingManger
    }

    public func getBanner() async -> Result<BannerResponse, MoviesError> {
        // swiftlint: disable line_length
        .success(
            BannerResponse(
            title: "Black Friday is here!",
            subTitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra sociis pulvinar auctor nibh nibh iaculis id.",
            image: "https://i.ibb.co/2F9m0Qk/banner.png")
        )
        // swiftlint: enable line_length
    }
}
