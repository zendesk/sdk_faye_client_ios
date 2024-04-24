// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "ZendeskSDKFayeClient",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "ZendeskSDKFayeClient",
            targets: [
                "ZendeskSDKFayeClientTargets"
            ]
        )
    ],
    dependencies: [
        .package(
            name: "ZendeskSDKSocketClient",
            url: "https://github.com/zendesk/sdk_socket_client_ios",
            from: "1.7.1"
        ),
        .package(
            name: "ZendeskSDKLogger",
            url: "https://github.com/zendesk/sdk_logger_ios",
            from: "0.9.1"
        )
    ],
    targets: [
        .binaryTarget(
            name: "ZendeskSDKFayeClient",
            path: "ZendeskSDKFayeClient.xcframework"
        ),
        .target(
            name: "ZendeskSDKFayeClientTargets",
            dependencies: [
                .target(name: "ZendeskSDKFayeClient"),
                .product(name: "ZendeskSDKSocketClient", package: "ZendeskSDKSocketClient"),
                .product(name: "ZendeskSDKLogger", package: "ZendeskSDKLogger")
            ],
            path: "Sources"
        )
    ]
)
