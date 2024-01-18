//
//  BannerResponse.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import Foundation

public struct BannerResponse: Codable {
    let title: String?
    let subTitle: String?
    let image: String?

    public init(title: String?,
                subTitle: String?,
                image: String?) {
        self.title = title
        self.subTitle = subTitle
        self.image = image
    }
}
