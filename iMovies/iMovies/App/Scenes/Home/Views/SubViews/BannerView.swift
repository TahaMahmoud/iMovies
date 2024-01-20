//
//  BannerView.swift
//  iMovies
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import Core
import DesignSystem
import SwiftUI

struct BannerView: View {
    var viewModel: BannerModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            bannerImageView
            bannerInfo
                .padding(.top, 16)
            PrimaryButton(title: "Check Details") {}
        }
    }

    var bannerImageView: some View {
        RemoteImage(url: viewModel.image)
            .frame(height: 165)
    }

    var bannerInfo: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(viewModel.title)
                .font(Font.montserrat(weight: .semiBold, size: 16))
                .foregroundStyle(DesignSystem.colors.white)
            Text(viewModel.description)
                .font(Font.montserrat(weight: .medium, size: 12))
                .foregroundStyle(DesignSystem.colors.white)
        }
    }
}

#Preview {
    BannerView(viewModel: .init(image: "https://i.ibb.co/2F9m0Qk/banner.png",
                                title: "Black Friday is here!",
                                description: "Lorem ipsum dolor sit amet",
                                detailsPressed: {}))
    .background(DesignSystem.colors.black)
}
