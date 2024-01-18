//
//  GetMoviesUseCaseInput.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import Foundation

public protocol GetMoviesUseCaseInputProtocol: Pagable {
}

public protocol Pagable {
    var page: Int { get set }
}

public struct GetMoviesUseCaseInput: GetMoviesUseCaseInputProtocol {
    public var page: Int

    public init(page: Int = 1) {
        self.page = page
    }
}
