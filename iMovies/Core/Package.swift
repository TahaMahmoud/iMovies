// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(name: "Core",
                 targets: ["Core"]),
        .library(name: "DataPersistence",
                 targets: ["DataPersistence"]),
    ],
    targets: [
        .target(
            name: "Core",
            dependencies: []
        ),
        .target(
            name: "DataPersistence"
        ),
        .testTarget(name: "CoreTests",
                    dependencies: ["Core"]),
        .testTarget(name: "DataPersistenceTests",
                    dependencies: ["DataPersistence"])
    ]
)
