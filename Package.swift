// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Alerts",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(name: "Alerts", targets: ["Alerts"]),
        .library(name: "AlertsUI", targets: ["AlertsUI"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Alerts", dependencies: [], path: "Alerts"),
        .target(name: "AlertsUI", dependencies: ["Alerts"], path: "AlertsUI"),
        .testTarget(name: "AlertsTests", dependencies: ["Alerts"], path: "Tests/AlertsTests"),
    ]
)
