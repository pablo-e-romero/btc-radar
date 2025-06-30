// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MEFramework",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "MEUtils",
            targets: ["MEUtils"]
        ),
    ],
    targets: [
        .target(name: "MEUtils"),
//        .testTarget(
//            name: "MEUITests",
//            dependencies: ["MEUI"]
//        ),
    ]
)
