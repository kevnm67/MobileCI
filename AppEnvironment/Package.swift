// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppEnvironment",
    products: [
        .library(
            name: "AppEnvironment",
            targets: ["AppEnvironment"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "AppEnvironment",
            dependencies: []),
        .testTarget(
            name: "AppEnvironmentTests",
            dependencies: ["AppEnvironment"]),
    ]
)
