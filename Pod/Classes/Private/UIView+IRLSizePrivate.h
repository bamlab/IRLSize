//
//  UIView+IRLSizePrivate.h
//  IRLSize
//
//  Created by Jeff Kelley on 7/6/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (IRLSizePrivate)

@property (nonatomic, readonly) BOOL irl_isOnMainScreen NS_SWIFT_NAME(isOnMainScreen);

@property (nonatomic, readonly) BOOL irl_isOnSecondaryScreen NS_SWIFT_NAME(isOnSecondaryScreen);

@end
