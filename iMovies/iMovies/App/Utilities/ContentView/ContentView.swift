//
//  ContentView.swift
//
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import SwiftUI
import Combine
import DesignSystem

struct ContentView<Source: LoadableObject,
                    LoadingView: View,
                    FailureView: View,
                    EmptyView: View,
                    Content: View>: View {
    @ObservedObject var source: Source
    var content: (Source.Output) -> Content
    var loadingContent: () -> LoadingView
    var failureContent: () -> FailureView
    var emptyContent: () -> EmptyView

    init(
        source: Source,
        @ViewBuilder content: @escaping (Source.Output) -> Content,
        @ViewBuilder loadingContent: @escaping () -> LoadingView,
        @ViewBuilder failureContent: @escaping () -> FailureView,
        @ViewBuilder emptyContent: @escaping () -> EmptyView
    ) {
        self.source = source
        self.content = content
        self.loadingContent = loadingContent
        self.failureContent = failureContent
        self.emptyContent = emptyContent
    }
    var body: some View {
        switch source.state {
        case .idle:
            Color.clear.onAppear(perform: source.load)
        case .loading:
            loadingContent()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(DesignSystem.colors.black)
        case .failed:
            failureContent()
                .background(DesignSystem.colors.black)
        case .loaded(let output):
            content(output)
                .background(DesignSystem.colors.black)
        case .empty:
            emptyContent()
                .background(DesignSystem.colors.black)
        }
    }
}
extension ContentView where LoadingView == AnyView {
    init(
        source: Source,
        @ViewBuilder content: @escaping (Source.Output) -> Content,
        @ViewBuilder failureContent: @escaping () -> FailureView,
        @ViewBuilder emptyContent: @escaping () -> EmptyView
    ) {
        self.init(
            source: source,
            content: content,
            loadingContent: {
                AnyView(
                    SpinnerView()
                )
            },
            failureContent: failureContent,
            emptyContent: emptyContent
        )
    }
}
