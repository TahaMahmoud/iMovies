//
//  GetBannerUseCase.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import Foundation

public protocol GetBannerUseCaseProtocol {
    func execute() async -> Result<BannerResponse,
        MoviesError>
}

public struct GetBannerUseCase: GetBannerUseCaseProtocol {
    private let repo: BannerRepoProtocol

    public init(repo: BannerRepoProtocol) {
        self.repo = repo
    }

    public func execute() async -> Result<BannerResponse,
        MoviesError> {
        await repo.get()
    }
}
