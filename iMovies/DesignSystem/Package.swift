// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DesignSystem",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(name: "DesignSystem",
                 targets: ["DesignSystem"])
    ],
    dependencies: [
        .package(name: "Core",
                 path: "../Core")
    ],
    targets: [
        .target(name: "DesignSystem",
                resources: [
                    .copy("../DesignSystem/Resources/Icons/Assets.xcassets"),
                    .copy("../DesignSystem/Resources/Fonts/iMovies/Montserrat-Black.ttf"),
                    .copy("../DesignSystem/Resources/Fonts/iMovies/Montserrat-BlackItalic.ttf"),
                    .copy("../DesignSystem/Resources/Fonts/iMovies/Montserrat-Bold.ttf"),
                    .copy("../DesignSystem/Resources/Fonts/iMovies/Montserrat-BoldItalic.ttf"),
                    .copy("../DesignSystem/Resources/Fonts/iMovies/Montserrat-ExtraBold.ttf"),
                    .copy("../DesignSystem/Resources/Fonts/iMovies/Montserrat-ExtraBoldItalic.ttf"),
                    .copy("../DesignSystem/Resources/Fonts/iMovies/Montserrat-ExtraLight.ttf"),
                    .copy("../DesignSystem/Resources/Fonts/iMovies/Montserrat-ExtraLightItalic.ttf"),
                    .copy("../DesignSystem/Resources/Fonts/iMovies/Montserrat-Italic.ttf"),
                    .copy("../DesignSystem/Resources/Fonts/iMovies/Montserrat-Light.ttf"),
                    .copy("../DesignSystem/Resources/Fonts/iMovies/Montserrat-LightItalic.ttf"),
                    .copy("../DesignSystem/Resources/Fonts/iMovies/Montserrat-Medium.ttf"),
                    .copy("../DesignSystem/Resources/Fonts/iMovies/Montserrat-MediumItalic.ttf"),
                    .copy("../DesignSystem/Resources/Fonts/iMovies/Montserrat-Regular.ttf"),
                    .copy("../DesignSystem/Resources/Fonts/iMovies/Montserrat-SemiBold.ttf"),
                    .copy("../DesignSystem/Resources/Fonts/iMovies/Montserrat-SemiBoldItalic.ttf"),
                    .copy("../DesignSystem/Resources/Fonts/iMovies/Montserrat-Thin.ttf"),
                    .copy("../DesignSystem/Resources/Fonts/iMovies/Montserrat-ThinItalic.ttf")]
               ),
        .testTarget(
            name: "DesignSystemTests",
            dependencies: ["DesignSystem"])
    ]
)
