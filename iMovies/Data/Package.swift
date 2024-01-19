// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Data",
    platforms: [.iOS(.v15), .macOS(.v12)],

    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ConfigData",
            targets: ["ConfigData"]),
        .library(
            name: "MoviesData",
            targets: ["MoviesData"])
    ],
    dependencies: [
        .package(
            name: "Core",
            path: "../Core"),
        .package(
            name: "Domain",
            path: "../Domain")
    ],
    targets: [
        .target(
            name: "ConfigData",
            dependencies: [
                .product(name: "Networking", package: "Core")
            ]
        ),
        .target(
            name: "MoviesData",
            dependencies: [
                .product(name: "MoviesDomain", package: "Domain"),
                .target(name: "ConfigData"),
                .product(name: "Networking", package: "Core"),
                .product(name: "DataPersistence", package: "Core")
            ]
        ),
        .testTarget(
            name: "ConfigDataTests",
            dependencies: ["ConfigData"]),
        .testTarget(
            name: "MoviesDataTests",
            dependencies: ["MoviesData"])
    ]
)
