// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "LeakDetector",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "LeakDetectorCore",
            targets: ["LeakDetectorCore"]
        ),
        .library(
            name: "LeakDetectorCombine",
            targets: ["LeakDetectorCombine"]
        )
    ],
    targets: [
        .target(
            name: "LeakDetectorCore",
            dependencies: []
        ),
        
        .target(
            name: "LeakDetectorCombine",
            dependencies: [
                "LeakDetectorCore",
            ]
        ),
        
        .testTarget(
            name: "LeakDetectorTests",
            dependencies: [
                "LeakDetectorCore",
                "LeakDetectorCombine"
            ]
        ),
    ]
)
