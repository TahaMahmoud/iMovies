//
//  RatingView.swift
//
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import SwiftUI

public struct RatingView: View {
    public var rating: Double

    public init(rating: Double) {
        self.rating = rating
    }

    public var body: some View {
        HStack(alignment: .center, spacing: 4) {
            Image(.icRatingStar)
                .resizable()
                .frame(width: 16, height: 16)
            Text(rating.string(maximumFractionDigits: 1))
                .font(Font.montserrat(weight: .semiBold, size: 12))
                .foregroundStyle(DesignSystem.colors.primary)
        }
    }
}

#Preview {
    RatingView(rating: 4.9)
}
