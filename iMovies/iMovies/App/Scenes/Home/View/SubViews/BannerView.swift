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
    var bannerImage: String
    var bannerTitle: String
    var bannerDescription: String
    var detailsPressed: Action

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            bannerImageView
            bannerInfo
                .padding(.top, 16)
            PrimaryButton(title: "Check Details") {}
        }
    }

    var bannerImageView: some View {
        RemoteImage(url: bannerImage)
            .frame(height: 165)
    }

    var bannerInfo: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(bannerTitle)
                .font(Font.montserrat(weight: .semiBold, size: 16))
                .foregroundStyle(DesignSystem.colors.white)
            Text(bannerTitle)
                .font(Font.montserrat(weight: .medium, size: 12))
                .foregroundStyle(DesignSystem.colors.white)
        }
    }
}

#Preview {
    BannerView(bannerImage: "https://i.ibb.co/2F9m0Qk/banner.png",
               bannerTitle: "Black Friday is here!",
               bannerDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra sociis  nibh iul",
               detailsPressed: {})
    .background(Color.black)
}
