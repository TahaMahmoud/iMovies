//
//  DIContainer+Networking.swift
//  iMovies
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import Foundation
import Networking
import ConfigData

extension Container: NetworkingConfigProtocol {
    static var networkManager: NetworkManagerProtocol {
        let remoteResponseHandler = NetworkResponseHandler(
          decoder: JSONDecoder(),
          encoder: JSONEncoder()
        )

        let networkManager = NetworkManager(
            responseHandler: remoteResponseHandler,
            authProvider: AuthManager.shared,
            logger: nil
          )

        return networkManager
    }
}
