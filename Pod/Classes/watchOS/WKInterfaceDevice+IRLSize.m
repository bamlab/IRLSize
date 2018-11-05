//
//  WKInterfaceDevice+IRLSize.m
//  IRLSize
//
//  Created by Jeff Kelley on 6/29/2016.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

#import "IRLSize.h"

#import <SDVersion/SDVersion.h>

// https://www.sven.de/dpi/ is a good resource for determining screen sizes.
static const float kAppleWatch38mmScreenWidth = 0.0212f;
static const float kAppleWatch38mmScreenHeight = 0.0265f;
static const float kAppleWatch40mmScreenWidth = 0.029f;
static const float kAppleWatch40mmScreenHeight = 0.0353f;
static const float kAppleWatch42mmScreenWidth = 0.0243f;
static const float kAppleWatch42mmScreenHeight = 0.0304f;
static const float kAppleWatch44mmScreenWidth = 0.0322f;
static const float kAppleWatch44mmScreenHeight = 0.0393f;

static const NSUInteger kAppleWatch38mmHeightPoints = 170;
static const NSUInteger kAppleWatch40mmHeightPoints = 197;
static const NSUInteger kAppleWatch42mmHeightPoints = 195;
static const NSUInteger kAppleWatch44mmHeightPoints = 224;

@implementation WKInterfaceDevice (IRLSize)

- (IRLRawDimensions)irl_estimatedRawPhysicalScreenSizeFromScreenPointHeight
{
    IRLRawDimensions estimatedDimensions = { 0.0f, 0.0f };
    
    NSUInteger heightPoints = round(CGRectGetHeight(self.screenBounds));
    
    switch (heightPoints) {
        case kAppleWatch38mmHeightPoints:
            estimatedDimensions.width = kAppleWatch38mmScreenWidth;
            estimatedDimensions.height = kAppleWatch38mmScreenHeight;
            break;

        case kAppleWatch40mmHeightPoints:
            estimatedDimensions.width = kAppleWatch40mmScreenWidth;
            estimatedDimensions.height = kAppleWatch40mmScreenHeight;
            break;
            
        case kAppleWatch42mmHeightPoints:
            estimatedDimensions.width = kAppleWatch42mmScreenWidth;
            estimatedDimensions.height = kAppleWatch42mmScreenHeight;
            break;

        case kAppleWatch44mmHeightPoints:
            estimatedDimensions.width = kAppleWatch44mmScreenWidth;
            estimatedDimensions.height = kAppleWatch44mmScreenHeight;
            break;
    }
    
    return estimatedDimensions;
}

- (IRLRawDimensions)irl_rawPhysicalScreenSize
{
    IRLRawDimensions size = { 0.0f, 0.0f };
    
    switch ([SDwatchOSVersion deviceVersion]) {
        case AppleWatch38mm:
        case AppleWatch38mmSeries1:
        case AppleWatch38mmSeries2:
            size.width = kAppleWatch38mmScreenWidth;
            size.height = kAppleWatch38mmScreenHeight;
            
        case AppleWatch42mm:
        case AppleWatch42mmSeries1:
        case AppleWatch42mmSeries2:
            size.width = kAppleWatch42mmScreenWidth;
            size.height = kAppleWatch42mmScreenHeight;
            
        default:
            size = [self irl_estimatedRawPhysicalScreenSizeFromScreenPointHeight];
    }

    return size;
}

- (NSMeasurement<NSUnitLength *> *)irl_physicalScreenHeight
{
    IRLRawDimensions deviceDimensions = [self irl_rawPhysicalScreenSize];
    
    return [[NSMeasurement alloc] initWithDoubleValue:deviceDimensions.height
                                                 unit:IRL_SIZE_UNIT];
}

- (NSMeasurement<NSUnitLength *> *)irl_physicalScreenWidth
{
    IRLRawDimensions deviceDimensions = [self irl_rawPhysicalScreenSize];
    
    return [[NSMeasurement alloc] initWithDoubleValue:deviceDimensions.width
                                                 unit:IRL_SIZE_UNIT];
}

- (IRLRawMillimeters)irl_rawPhysicalScreenHeight
{
    return [self irl_rawPhysicalScreenSize].height;
}

- (IRLRawMillimeters)irl_rawPhysicalScreenWidth
{
    return [self irl_rawPhysicalScreenSize].width;
}

@end
