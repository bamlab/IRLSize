//
//  IRLSizePrivate.h
//  IRLSize
//
//  Created by Jeff Kelley on 6/29/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#ifndef IRLSizePrivate_h
#define IRLSizePrivate_h

typedef float RawLengthMeasurement; // meters

typedef struct {
    RawLengthMeasurement width;
    RawLengthMeasurement height;
} RawSize;

#define RAW_SIZE_UNIT NSUnitLength.meters

#endif /* IRLSizePrivate_h */
