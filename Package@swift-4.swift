// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "HelloCairoGtk",
    products: [
        .executable(
            name: "HelloCairoGtk",
            targets: ["HelloCairoGtk"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/rpinz/SwiftGtk",
            .branch("master")),
    ],
    targets: [
        .target(
            name: "HelloCairoGtk",
            dependencies: ["Gtk"],
            path: "Sources"),
    ],
    swiftLanguageVersions: [4]
)
