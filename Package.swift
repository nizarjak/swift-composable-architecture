// swift-tools-version:5.1

import PackageDescription

let package = Package(
  name: "swift-composable-architecture",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
    .tvOS(.v13),
    .watchOS(.v6),
  ],
  products: [
    .library(
      name: "ComposableArchitecture",
      type: .dynamic,
      targets: ["ComposableArchitecture"]
    ),
    .library(
      name: "ComposableArchitectureStatic",
      targets: ["ComposableArchitecture"]
    ),
    .library(
      name: "ComposableArchitectureTestSupport",
      type: .dynamic,
      targets: ["ComposableArchitectureTestSupport"]
    ),
    .library(
      name: "ComposableArchitectureTestSupportStatic",
      targets: ["ComposableArchitectureTestSupport"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/combine-schedulers", from: "0.1.0"),
    .package(url: "https://github.com/pointfreeco/swift-case-paths", from: "0.1.1"),
  ],
  targets: [
    .target(
      name: "ComposableArchitecture",
      dependencies: [
        "CasePaths",
        "CombineSchedulers",
      ]
    ),
    .testTarget(
      name: "ComposableArchitectureTests",
      dependencies: [
        "CombineSchedulers",
        "ComposableArchitecture",
        "ComposableArchitectureTestSupport"
      ]
    ),
    .target(
      name: "ComposableArchitectureTestSupport",
      dependencies: [
        "ComposableArchitecture"
      ]
    )
  ]
)
