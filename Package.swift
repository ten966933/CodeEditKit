// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "CodeEditKit",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "CodeEditKit",
            type: .dynamic,
            targets: ["CodeEditKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/ChimeHQ/ConcurrencyPlus", from: "0.4.1"),
        .package(url: "https://github.com/ChimeHQ/LanguageClient", from: "0.5.0"),
        .package(url: "https://github.com/ChimeHQ/ProcessService", from: "0.2.6"),
        .package(
            url: "https://github.com/lukepistrol/SwiftLintPlugin",
            from: "0.2.2"
        ),
        .package(
            url: "https://github.com/Flight-School/AnyCodable",
            from: "0.6.0"
        )
    ],
    targets: [
        .target(
            name: "CodeEditKit",
            dependencies: ["AnyCodable", "ConcurrencyPlus", "LanguageClient", .product(name: "ProcessServiceClient", package: "ProcessService")],
            plugins: [.plugin(name: "SwiftLint", package: "SwiftLintPlugin")]
        ),
        .testTarget(
            name: "CodeEditKitTests",
            dependencies: ["CodeEditKit"])
    ]
)
