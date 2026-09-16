// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "DockhandAPI",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "DockhandAPI",
            targets: ["DockhandAPI"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-openapi-runtime", "1.0.0"..<"1.11.0"),
        .package(url: "https://github.com/apple/swift-openapi-urlsession", "1.0.0"..<"1.3.0")
    ],
    targets: [
        .target(
            name: "DockhandAPI",
            dependencies: [
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
                .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession")
            ],
            path: "Sources/DockhandAPI"
        )
    ]
)
