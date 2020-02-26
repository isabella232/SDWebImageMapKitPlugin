# SDWebImageMapKitPlugin

[![CI Status](https://img.shields.io/travis/SDWebImage/SDWebImageMapKitPlugin.svg?style=flat)](https://travis-ci.org/SDWebImage/SDWebImageMapKitPlugin)
[![Version](https://img.shields.io/cocoapods/v/SDWebImageMapKitPlugin.svg?style=flat)](https://cocoapods.org/pods/SDWebImageMapKitPlugin)
[![License](https://img.shields.io/cocoapods/l/SDWebImageMapKitPlugin.svg?style=flat)](https://cocoapods.org/pods/SDWebImageMapKitPlugin)
[![Platform](https://img.shields.io/cocoapods/p/SDWebImageMapKitPlugin.svg?style=flat)](https://cocoapods.org/pods/SDWebImageMapKitPlugin)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg?style=flat)](https://github.com/SDWebImage/SDWebImageMapKitPlugin)
[![SwiftPM compatible](https://img.shields.io/badge/SwiftPM-compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager/)
[![codecov](https://codecov.io/gh/SDWebImage/SDWebImageMapKitPlugin/branch/master/graph/badge.svg)](https://codecov.io/gh/SDWebImage/SDWebImageMapKitPlugin)

## What's for
SDWebImageMapKitPlugin is a plugin for [SDWebImage](https://github.com/rs/SDWebImage/) framework, which provide the [MapKit](https://developer.apple.com/documentation/mapkit) integration and category.

SDWebImage previously have a subspec to hold these integration code, however, since this is not the core feature of SDWebImage, due to the project maintain issue, we move the MapKit integration into a standalone framework.

## Requirements

+ iOS 8+
+ macOS 10.10+
+ tvOS 9.2+
+ Xcode 11+

## Installation

#### CocoaPods

SDWebImageMapKitPlugin is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SDWebImageMapKitPlugin'
```

#### Carthage

SDWebImageMapKitPlugin is available through [Carthage](https://github.com/Carthage/Carthage).

```
github "SDWebImage/SDWebImageMapKitPlugin"
```

#### Swift Package Manager (Xcode 11+)

SDWebImageMapKitPlugin is available through [Swift Package Manager](https://swift.org/package-manager).

```swift
let package = Package(
    dependencies: [
        .package(url: "https://github.com/SDWebImage/SDWebImageMapKitPlugin.git", from: "0.1")
    ]
)
```

## Usage

+ Objective-C

```objective-c
MKAnnotationView *annotationView;
NSURL *imageURL;
[annotationView sd_setImageWithURL:imageURL];
```

+ Swift

```swift
let annotationView: MKAnnotationView
let imageURL: URL
annotationView.sd_setImage(with: imageURL)
```

## Author

DreamPiggy

## License

SDWebImageMapKitPlugin is available under the MIT license. See the LICENSE file for more info.
