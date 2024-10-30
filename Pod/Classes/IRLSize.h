#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef int IRLRawMillimeters;

@interface IRLDeviceMeasurements : NSObject

@property (nonatomic, readonly) IRLRawMillimeters irl_rawPhysicalScreenHeight NS_SWIFT_NAME(rawPhysicalScreenHeight);
@property (nonatomic, readonly) IRLRawMillimeters irl_rawPhysicalScreenWidth NS_SWIFT_NAME(rawPhysicalScreenWidth);

- (NSInteger)convertMmSizeToDp:(NSInteger)sizeInMm;

@end