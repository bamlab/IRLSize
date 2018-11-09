//
//  IRLSizeMacros.h
//  IRLSize
//
//  Created by Jeff Kelley on 11/8/2018.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

#ifndef IRLSizeMacros_h
#define IRLSizeMacros_h

#if IRLSIZE_DEBUG
#define DEBUG_LOG(x) NSLog(x)
#else
#define DEBUG_LOG(x)
#endif

#define IRL_SIZE_UNIT NSUnitLength.millimeters
#define IRL_MM(x) [[NSMeasurement alloc] initWithDoubleValue:(x) unit:IRL_SIZE_UNIT]

#define IRL_ESTIMATED_DIMENSIONS(variable, deviceType, size) \
    case k##deviceType##size##HeightPoints: { \
        DEBUG_LOG(@"Estimating height of " #deviceType " at " #size "."); \
        variable.height = k##deviceType##size##ScreenHeight; \
        variable.width = k##deviceType##size##ScreenWidth; \
    } \
    break;

#define IRL_KNOWN_DEVICE_DIMENSIONS_UNMATCHING(modelEnum, sizeEnumPrefix)\
    case modelEnum: { \
        DEBUG_LOG(@"Local device matches " #modelEnum "."); \
        size.height = k##sizeEnumPrefix##ScreenHeight; \
        size.width = k##sizeEnumPrefix##ScreenWidth; \
    } \
    break;

#define IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(enum) \
    IRL_KNOWN_DEVICE_DIMENSIONS_UNMATCHING(enum, enum)

#endif /* IRLSizeMacros_h */
