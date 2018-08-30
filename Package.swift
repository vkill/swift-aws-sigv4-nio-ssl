// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "AwsSigv4CNIOSSL",
    products: [
        .library(name: "AwsSigv4CNIOSSL", targets: ["AwsSigv4CNIOSSL"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vkill/swift-aws-sigv4.git", .branch("master")),
        .package(url: "https://github.com/apple/swift-nio-ssl.git", from: "1.1.0"),
    ],
    targets: [
        .target(name: "AwsSigv4CNIOSSL", dependencies: ["AwsSigv4", "NIOOpenSSL"]),
        .testTarget(name: "AwsSigv4CNIOSSLTests", dependencies: ["AwsSigv4CNIOSSL"]),
    ]
)
