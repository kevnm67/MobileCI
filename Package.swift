// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Circle-CI-Playground",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Circle-CI-Playground",
            targets: ["Circle-CI-Playground"]
        )
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // Dev dependencies
        .package(url: "https://github.com/shibapm/Komondor", from: "1.0.0"),
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.40.13"),
        .package(url: "https://github.com/Realm/SwiftLint", from: "0.36.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Circle-CI-Playground",
            dependencies: []
        ),
        .testTarget(
            name: "Circle-CI-PlaygroundTests",
            dependencies: ["Circle-CI-Playground"]
        )
    ]
)

#if canImport(PackageConfig)
import PackageConfig

let config = PackageConfiguration([
    "komondor": [
        "pre-push": "swift test",
        "pre-commit": [
            "swift run swiftformat .",
            "swift run swiftlint autocorrect --path Sources/",
            "git add ."
        ]
    ]
]).write()
#endif
