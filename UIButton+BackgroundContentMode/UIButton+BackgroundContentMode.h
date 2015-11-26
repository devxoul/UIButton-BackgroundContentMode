//
//  UIButton+BackgroundContentMode.h
//  UIButton+BackgroundContentMode
//
//  Created by 전수열 on 11/26/15.
//  Copyright © 2015 Suyeol Jeon. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for UIButton+BackgroundContentMode.
FOUNDATION_EXPORT double UIButton_BackgroundContentModeVersionNumber;

//! Project version string for UIButton+BackgroundContentMode.
FOUNDATION_EXPORT const unsigned char UIButton_BackgroundContentModeVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <UIButton_BackgroundContentMode/PublicHeader.h>



@interface UIButton (BackgroundContentMode)

@property (nonatomic, assign, nullable) UIImageView *backgroundImageView;
@property (nonatomic, assign) UIViewContentMode backgroundContentMode;

@end
