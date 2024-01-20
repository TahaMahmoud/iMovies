//
//  LoadingState.swift
//
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import SwiftUI
import Combine
enum ViewState<Value>: Equatable {
    static func == (lhs: ViewState<Value>, rhs: ViewState<Value>) -> Bool {
        return String(describing: lhs.self) == String(describing: rhs.self)
    }

    case idle
    case loading
    case failed(Error)
    case loaded(Value)
    case empty
}
