#import "IRLSize.h"
#import <UIKit/UIKit.h>
#import <sys/utsname.h>

@implementation IRLDeviceMeasurements

// Device Measurements Dictionary
+ (NSDictionary<NSString *, NSDictionary<NSString *, NSNumber *> *> *)deviceMeasurements {
    return @{
        @"iPhone8,1": @{@"height": @104.05, @"width": @58.49 }, // iPhone 6s
        @"iPhone8,2": @{@"height": @121.54, @"width": @68.36 }, // iPhone 6s Plus
        @"iPhone9,1": @{@"height": @104.05, @"width": @58.5 }, // iPhone 7
        @"iPhone9,3": @{@"height": @104.05, @"width": @58.5 }, // iPhone 7
        @"iPhone9,2": @{@"height": @121.54, @"width": @68.36 }, // iPhone 7 Plus
        @"iPhone9,4": @{@"height": @121.54, @"width": @68.36 }, // iPhone 7 Plus
        @"iPhone10,1": @{@"height": @104.05, @"width": @58.5 }, // iPhone 8
        @"iPhone10,4": @{@"height": @104.05, @"width": @58.5 }, // iPhone 8
        @"iPhone10,2": @{@"height": @121.54, @"width": @68.36 }, // iPhone 8 Plus
        @"iPhone10,5": @{@"height": @121.54, @"width": @68.36 }, // iPhone 8 Plus
        @"iPhone10,3": @{@"height": @135.75, @"width": @63.12 }, // iPhone X
        @"iPhone10,6": @{@"height": @135.75, @"width": @63.12 }, // iPhone X
        @"iPhone11,8": @{@"height": @139.78, @"width": @64.58 }, // iPhone XR
        @"iPhone11,2": @{@"height": @135.75, @"width": @63.13 }, // iPhone XS
        @"iPhone11,6": @{@"height": @149.71, @"width": @69.61 }, // iPhone XS Max
        @"iPhone12,1": @{@"height": @139.78, @"width": @64.58 }, // iPhone 11
        @"iPhone12,3": @{@"height": @134.95, @"width": @62.33 }, // iPhone 11 Pro
        @"iPhone12,5": @{@"height": @148.91, @"width": @68.81 }, // iPhone 11 Pro Max
        @"iPhone12,8": @{@"height": @104.05, @"width": @58.5 }, // iPhone SE (2nd Generation)
        @"iPhone13,2": @{@"height": @139.77, @"width": @64.58 }, // iPhone 12
        @"iPhone13,1": @{@"height": @124.96, @"width": @57.67 }, // iPhone 12 mini
        @"iPhone13,3": @{@"height": @139.77, @"width": @64.58 }, // iPhone 12 Pro
        @"iPhone13,4": @{@"height": @153.9, @"width": @71.13 }, // iPhone 12 Pro Max
        @"iPhone14,4": @{@"height": @124.96, @"width": @57.67 }, // iPhone 13 mini
        @"iPhone14,5": @{@"height": @139.77, @"width": @64.58 }, // iPhone 13
        @"iPhone14,2": @{@"height": @139.77, @"width": @64.58 }, // iPhone 13 Pro
        @"iPhone14,3": @{@"height": @153.9, @"width": @71.13 }, // iPhone 13 Pro Max
        @"iPhone14,7": @{@"height": @139.77, @"width": @64.58 }, // iPhone 14
        @"iPhone14,8": @{@"height": @153.9, @"width": @71.13 }, // iPhone 14 Plus
        @"iPhone15,2": @{@"height": @141.09, @"width": @65.08 }, // iPhone 14 Pro
        @"iPhone15,3": @{@"height": @154.34, @"width": @71.21 }, // iPhone 14 Pro Max
        @"iPhone15,4": @{@"height": @141.09, @"width": @65.08 }, // iPhone 15
        @"iPhone15,5": @{@"height": @154.34, @"width": @71.21 }, // iPhone 15 Plus
        @"iPhone16,1": @{@"height": @141.09, @"width": @65.08 }, // iPhone 15 Pro
        @"iPhone16,2": @{@"height": @154.34, @"width": @71.21 }, // iPhone 15 Pro Max
        @"iPhone17,1": @{@"height": @144.79, @"width": @66.57 }, // iPhone 16 Pro
        @"iPhone17,2": @{@"height": @158.31, @"width": @72.86 }, // iPhone 16 Pro Max
        @"iPhone17,3": @{@"height": @141.09, @"width": @65.08 }, // iPhone 16
        @"iPhone17,4": @{@"height": @154.34, @"width": @71.21 }, // iPhone 16 Plus
    };
}

// Helper to fetch current device ID
- (NSString *)currentDeviceID {
    struct utsname systemInfo;
    uname(&systemInfo);
    return [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
}

// Height property implementation
- (IRLRawMillimeters)irl_rawPhysicalScreenHeight {
    NSDictionary *dimensions = [self fetchDeviceMeasurements];
    return [dimensions[@"height"] doubleValue];
}

// Width property implementation
- (IRLRawMillimeters)irl_rawPhysicalScreenWidth {
    NSDictionary *dimensions = [self fetchDeviceMeasurements];
    return [dimensions[@"width"] doubleValue];
}

// Fetch measurements based on Device ID
- (NSDictionary *)fetchDeviceMeasurements {
    NSString *deviceID = [self currentDeviceID];
    NSDictionary *measurements = [[self.class deviceMeasurements] objectForKey:deviceID];
    
    if (!measurements) {
        measurements = @{@"height": @139.78, @"width": @64.58}; // Default to iPhone 11 if unknown
    }
    return measurements;
}

// Conversion method implementation
- (NSInteger)convertMmSizeToDp:(NSInteger)sizeInMm {
    NSDictionary *dimensions = [self fetchDeviceMeasurements];
    IRLRawMillimeters heightInMm = [dimensions[@"height"] doubleValue];
    
    CGFloat heightInDp = MAX(UIScreen.mainScreen.bounds.size.height, UIScreen.mainScreen.bounds.size.width);
    
    return round((sizeInMm * heightInDp) / heightInMm);
}

@end