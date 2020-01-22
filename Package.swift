// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Alerts",
    products: [
        .library(
            name: "Alerts",
            targets: ["Alerts"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Alerts",
            dependencies: [],
            path: "Alerts")
    ]
)
