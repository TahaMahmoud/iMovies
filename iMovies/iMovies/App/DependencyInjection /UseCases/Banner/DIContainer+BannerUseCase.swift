//
//  DIContainer+BannerUseCase.swift
//  iMovies
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import ConfigData
import Foundation
import MoviesData
import MoviesDomain

extension Container {
    static var getBannerUseCase: GetBannerUseCaseProtocol {
        return GetBannerUseCase(repo: DIContainer.bannerRepo)
    }
}
