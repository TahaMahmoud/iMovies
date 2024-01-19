//
//  AuthManager.swift
//  iMovies
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import Foundation
import Networking

class AuthManager: AuthTokenProviderProtocol {
    static var shared: AuthManager = AuthManager()
    private init() {}
    var bearerToken: JWT?
    var refreshToken: JWT?
}
