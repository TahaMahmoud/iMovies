//
//  SpinnerView.swift
//
//
//  Created by Taha Mahmoud on 20/01/2024.
//

import SwiftUI
import DesignSystem

public struct SpinnerView: View {
    // MARK: - Properties
    @State private var degree: Int = 270
    @State private var spinnerLength = 0.6
    public init(degree: Int = 270, spinnerLength: Double = 0.6) {
        self.degree = degree
        self.spinnerLength = spinnerLength
    }
    // MARK: - Body
    public var body: some View {
        Circle()
            .trim(from: 0.0, to: spinnerLength)
            .stroke(
                DesignSystem.colors.primary,
                style: StrokeStyle(
                    lineWidth: 9.0,
                    lineCap: .square,
                    lineJoin: .round
                )
            )
            .animation(
                Animation.easeIn(duration: 1.5)
                    .repeatForever(autoreverses: true),
                value: degree
            )
            .frame(width: 88, height: 88)
            .rotationEffect(Angle(degrees: Double(degree)))
            .animation(
                Animation.linear(duration: 1)
                    .repeatForever(autoreverses: false),
                value: degree
            )
            .onAppear {
                DispatchQueue.main.async {
                    degree = 270 + 360
                    spinnerLength = 0
                }
            }
    }
}
#Preview {
    SpinnerView()
}
