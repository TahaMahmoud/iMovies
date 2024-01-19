//
//  NetworkingConfigurator.swift
//
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import Foundation
import Networking

public final class NetworkingConfigurator {
    static var shared: NetworkingConfigurator?

    public let networkManager: NetworkManagerProtocol

    fileprivate init(_ config: NetworkingConfigProtocol.Type) {
        self.networkManager = config.networkManager
    }
}

public protocol NetworkingConfigProtocol {
    static var networkManager: NetworkManagerProtocol { get }
}

public func setup(networkingConfig config: NetworkingConfigProtocol.Type) {
    NetworkingConfigurator.shared = NetworkingConfigurator(config)
}

public var networkConfig: NetworkingConfigurator {
    if let config = NetworkingConfigurator.shared {
        return config
    } else {
        fatalError("Please set the Config for \(Bundle(for: NetworkingConfigurator.self))")
    }
}
