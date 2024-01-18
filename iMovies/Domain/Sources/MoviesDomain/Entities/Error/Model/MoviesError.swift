//
//  MoviesError.swift
//
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import Foundation
import CoreDomain

public enum MoviesError: AppErrorProtocol {
    case encoding
    case error(message: String)
    case unknown
}
