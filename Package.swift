// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "WebViewKit",
    platforms: [
        .iOS(.v13),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "WebViewKit",
            targets: ["WebViewKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "WebViewKit",
            dependencies: []),
        .testTarget(
            name: "WebViewKitTests",
            dependencies: ["WebViewKit"]),
    ]
)
