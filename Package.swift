import PackageDescription

let package = Package(
    name: "HelloCairoGtk",
    dependencies: [
        .Package(url: "https://github.com/rpinz/SwiftGtk.git", majorVersion: 3)
    ],
    swiftLanguageVersions: [3, 4]
)
