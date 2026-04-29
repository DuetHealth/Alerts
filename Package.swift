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
        .target(name: "Alerts", dependencies: [], path: "Alerts", exclude: ["Info.plist"]),
        .target(name: "AlertsUI", dependencies: ["Alerts"], path: "AlertsUI", exclude: ["Info.plist"]),
        .testTarget(name: "AlertsTests", dependencies: ["Alerts"], path: "Tests/AlertsTests"),
    ]
)
