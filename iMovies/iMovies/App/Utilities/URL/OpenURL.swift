//
//  OpenURL.swift
//  iMovies
//
//  Created by Taha Mahmoud on 21/01/2024.
//

import UIKit

struct URLUtility {
    static func openURL(_ urlString: String) {
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
