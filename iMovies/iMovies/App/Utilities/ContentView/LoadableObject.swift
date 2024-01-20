//
//  LoadableObject.swift
//
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import SwiftUI
import Combine

protocol LoadableObject: ObservableObject {
    associatedtype Output
    var state: ViewState<Output> { get }
    func load()
}
