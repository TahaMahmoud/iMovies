//
//  BannerResponse.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import Foundation

public struct BannerResponse: Codable {
    public let title: String?
    public let subTitle: String?
    public let image: String?

    public init(title: String?,
                subTitle: String?,
                image: String?) {
        self.title = title
        self.subTitle = subTitle
        self.image = image
    }
}
