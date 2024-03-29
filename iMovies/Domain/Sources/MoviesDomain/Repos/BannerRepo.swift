//
//  BannerRepo.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import Foundation

public protocol BannerRepoProtocol {
    func get() async -> Result<BannerResponse, MoviesError>
}
