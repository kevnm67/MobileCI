// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "MobileCI",
    products: [
        .library(
            name: "MobileCI",
            targets: ["MobileCI"]
        )
    ],
    dependencies: [
        // Dev dependencies
        .package(url: "https://github.com/shibapm/Komondor", from: "1.0.0"), // dev
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.40.14"), // dev
        .package(url: "https://github.com/Realm/SwiftLint", from: "0.36.0") // dev
    ],
    targets: [
        .target(
            name: "MobileCI",
            dependencies: [],
            exclude: [
                "Tests",
                "Sources/Supporting Files",
                "Examples"
            ]
        ),
        .testTarget(name: "MobileCITests", dependencies: ["MobileCI"]) // dev
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
