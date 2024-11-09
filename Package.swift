// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "DGCatalog",
    products: [
        .library(name: "DGCatalog", targets: ["DGCatalog"])
    ],
    dependencies: [
        .package(url: "https://github.com/debugeek/DGExtension.git", .branch("main")),
        .package(url: "https://github.com/debugeek/DGFoundation.git", .branch("main"))
    ],
    targets: [
        .target(name: "DGCatalog", dependencies: ["DGExtension", "DGFoundation"])
    ]
)
