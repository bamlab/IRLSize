# IRLSize

IRLSize is an iOS library in Objective-C for converting physical measurements (in millimeters) to device-specific density-independent pixels (dp) for Swift applications. The library includes properties for retrieving the physical dimensions of a device’s screen and a utility method to convert millimeter sizes to dp without needing a Swift bridge.

## Features

- Retrieve physical screen height and width in millimeters for supported iOS devices.
- Convert millimeter values to dp accurately based on device-specific measurements.
- Fallback handling for unsupported devices.

## Installation

### Using CocoaPods
Add IRLSize to your Podfile:
```ruby
pod 'IRLSize', :git => 'https://github.com/bamlab/IRLSize', :branch => 'main'
```

## Usage

### Swift Integration

To use IRLSize in Swift:

1. Import the module.
2. IRLDeviceMeasurements.
3. Access properties and call methods directly.

Example:
```swift
import IRLSize

let deviceMeasurements = IRLDeviceMeasurements()
let heightInMm = deviceMeasurements.rawPhysicalScreenHeight
let widthInMm = deviceMeasurements.rawPhysicalScreenWidth
let sizeInDp = deviceMeasurements.convertMmSize(toDp: 20) // Convert 20 mm to dp
```

## Supported Devices

IRLSize includes predefined physical dimensions for popular iOS devices. For unsupported devices, the library defaults to the dimensions of an iPhone 11.

If you need to add support for additional devices, refer to [Apple’s Accessory Design Guidelines](https://developer.apple.com/accessories/Accessory-Design-Guidelines.pdf) to obtain accurate measurements (find in the table of content the device, look at the schema's and the size is the display active area).

## Contributing

Contributions to expand device support or improve conversion accuracy are welcome! Please submit a pull request.

## Historic

This was a fork from https://github.com/detroit-labs/IRLSize however it is not maintained anymore and could not be simply patch. This is why it has been forked and rework to just compute the size.