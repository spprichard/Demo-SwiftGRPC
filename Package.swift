// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Echo",
    products:[
        .executable(name: "EchoServer", targets: ["EchoServer"]),
        .executable(name: "EchoClient", targets: ["EchoClient"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/grpc/grpc-swift.git", .exact("0.6.0"))

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "EchoServer",
            dependencies: ["SwiftGRPC"]),
        .target(
            name: "EchoClient",
            dependencies: ["SwiftGRPC"]),
    ]
)
