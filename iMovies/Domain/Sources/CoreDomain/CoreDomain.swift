//
//  CoreDomain.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import Foundation

protocol UseCase {
    associatedtype Input
    associatedtype ReturnType
    associatedtype ReturnErrorType: Error

    func execute(_ input: Input) async -> Result<ReturnType, ReturnErrorType>
}

public protocol DecodableFromDTO {
    associatedtype DTO: Decodable
    init(from dto: DTO)
}
