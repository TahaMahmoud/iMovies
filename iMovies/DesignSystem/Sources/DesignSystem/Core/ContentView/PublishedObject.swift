//
//  PublishedObject.swift
//
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import Foundation
import SwiftUI
import Combine

class PublishedObject<Wrapped: Publisher>: LoadableObject {
    @Published private(set) var state = ViewState<Wrapped.Output>.idle

    private let publisher: Wrapped
    private var cancellable: AnyCancellable?

    init(publisher: Wrapped) {
        self.publisher = publisher
    }

    func load() {
        state = .loading

        cancellable = publisher
            .map(ViewState.loaded)
            .catch { error in
                Just(ViewState.failed(error))
            }
            .sink { [weak self] state in
                self?.state = state
            }
    }
}
extension ContentView {
    init<P: Publisher>(
        source: P,
        @ViewBuilder content: @escaping (P.Output) -> Content,
        @ViewBuilder loadingContent: @escaping () -> LoadingView,
        @ViewBuilder failureContent: @escaping () -> FailureView,
        @ViewBuilder emptyContent: @escaping () -> EmptyView
    ) where Source == PublishedObject<P> {
        self.init(
            source: PublishedObject(publisher: source),
            content: content,
            loadingContent: loadingContent,
            failureContent: failureContent,
            emptyContent: emptyContent
        )
    }
}
