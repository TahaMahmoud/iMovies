//
//  ViewModelMapperProtocol.swift
//
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import Foundation
/**
use this protocol to add mapping in your view model from domain model to view model
 */

public protocol ViewModelMapperProtocol {
    associatedtype InputProtocol
    associatedtype OutputProtocol

    func map(domain: InputProtocol) -> OutputProtocol
}
