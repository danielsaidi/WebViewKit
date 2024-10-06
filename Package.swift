// swift-tools-version: 6.0

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
    targets: [
        .target(
            name: "WebViewKit"
        ),
        .testTarget(
            name: "WebViewKitTests",
            dependencies: ["WebViewKit"]
        )
    ]
)
