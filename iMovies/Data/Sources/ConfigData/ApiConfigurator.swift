//
//  ApiConfigurator.swift
//
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import Foundation

public final class ApiConfigurator {
    static var shared: ApiConfigurator?

    public let baseURL: URL
    public let apiVersion: String
    public let apiKey: String
    public let language: String

    fileprivate init(_ config: ApiConfigProtocol.Type) {
        self.baseURL = config.baseURL
        self.apiVersion = config.apiVersion
        self.apiKey = config.apiKey
        self.language = config.language
    }
}

public protocol ApiConfigProtocol {
    static var baseURL: URL { get }
    static var apiVersion: String { get }
    static var apiKey: String { get }
    static var language: String { get }
}

public func setup(apiConfig config: ApiConfigProtocol.Type) {
    ApiConfigurator.shared = ApiConfigurator(config)
}

public var apiConfig: ApiConfigurator {
    if let config = ApiConfigurator.shared {
        return config
    } else {
        fatalError("Please set the Config for \(Bundle(for: ApiConfigurator.self))")
    }
}
