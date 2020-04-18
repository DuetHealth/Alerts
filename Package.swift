// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Alerts",
    platforms: [
      .iOS(.v8),
    ],
    products: [
        .library(name: "Alerts", targets: ["Alerts"]),
	.library(name: "AlertsUI", targets: ["AlertsUI"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Alerts", dependencies: [], path: "Alerts"),
        .target(name: "AlertsUI", dependencies: ["Alerts"], path: "AlertsUI"),
    ]
)
