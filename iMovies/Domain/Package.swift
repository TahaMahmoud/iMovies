// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(
            name: "CoreDomain",
            targets: ["CoreDomain"]),
        .library(
            name: "MoviesDomain",
            targets: ["MoviesDomain"])
    ],
    dependencies: [
        .package(name: "Core",
                 path: "../Core")
    ],
    targets: [
        .target(
            name: "CoreDomain"
        ),
        .target(
            name: "MoviesDomain",
            dependencies: [
                .target(name: "CoreDomain"),
                .product(name: "DataPersistence", package: "Core")
            ]
        ),
        .testTarget(
            name: "MoviesDomainTests",
            dependencies: ["MoviesDomain"])
    ]
)
