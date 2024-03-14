// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "WebViewKit",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "WebViewKit",
            targets: ["WebViewKit"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "WebViewKit",
            dependencies: []
        ),
        .testTarget(
            name: "WebViewKitTests",
            dependencies: ["WebViewKit"]
        )
    ]
)
