// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MEFramework",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "MEUI",
            targets: ["MEUI"]
        ),
    ],
    targets: [
        .target(name: "MEUI"),
        .testTarget(
            name: "MEUITests",
            dependencies: ["MEUI"]
        ),
    ]
)
