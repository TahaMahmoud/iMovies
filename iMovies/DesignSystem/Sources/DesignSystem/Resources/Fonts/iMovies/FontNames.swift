//
//  FontNames.swift
//
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import Foundation
import SwiftUI

internal func iMoviesFontNames() -> [String] {
    return ["Montserrat-Black",
            "Montserrat-BlackItalic",
            "Montserrat-Bold",
            "Montserrat-BoldItalic",
            "Montserrat-ExtraBold",
            "Montserrat-ExtraBoldItalic",
            "Montserrat-ExtraLight",
            "Montserrat-ExtraLightItalic",
            "Montserrat-Italic",
            "Montserrat-Light",
            "Montserrat-LightItalic",
            "Montserrat-Medium",
            "Montserrat-MediumItalic",
            "Montserrat-Regular",
            "Montserrat-SemiBold",
            "Montserrat-SemiBoldItalic",
            "Montserrat-Thin",
            "Montserrat-ThinItalic"]
}

public extension Font {
    static func montserrat(weight: MontserratFontWeight, size: CGFloat) -> Font {
        Font.custom("Montserrat-\(weight.rawValue)", size: size)
    }
}

public enum MontserratFontWeight: String {
    case black = "Black"
    case blackItalic = "BlackItalic"
    case bold = "Bold"
    case boldItalic = "BoldItalic"
    case extraBold = "ExtraBold"
    case extraBoldItalic = "ExtraBoldItalic"
    case extraLight = "ExtraLight"
    case extraLightItalic = "ExtraLightItalic"
    case italic = "Italic"
    case light = "Light"
    case lightItalic = "LightItalic"
    case medium = "Medium"
    case mediumItalic = "MediumItalic"
    case regular = "Regular"
    case semiBold = "SemiBold"
    case semiBoldItalic = "SemiBoldItalic"
    case thin = "Thin"
    case thinItalic = "ThinItalic"
}
