// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Core",
            targets: ["Core"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/hmlongco/Factory.git", from: "2.3.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.9.0"),
        .package(name: "Domain", path: "../Domain"),
    ],
    targets: [
        .target(
            name: "Core",
            dependencies: [
                .product(name: "Factory", package: "Factory"),
                .product(name: "Alamofire", package: "Alamofire"),
                "Domain",
                "Core"
            ]
        ),

    ]
)
