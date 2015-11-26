// The MIT License (MIT)
//
// Copyright (c) 2015 Suyeol Jeon (http://xoul.kr)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#import <objc/runtime.h>
#import "UIButton+BackgroundContentMode.h"


@implementation UIButton (BackgroundContentMode)

#pragma mark Swizzling Methods

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzle:@selector(setBackgroundImage:forState:)];
    });
}

+ (void)swizzle:(SEL)selector {
    NSString *name = [NSString stringWithFormat:@"swizzled_%@", NSStringFromSelector(selector)];
    Method m1 = class_getInstanceMethod(self, selector);
    Method m2 = class_getInstanceMethod(self, NSSelectorFromString(name));
    method_exchangeImplementations(m1, m2);
}


#pragma mark Background Content Mode

- (UIViewContentMode)backgroundContentMode {
    NSNumber *rawValue = objc_getAssociatedObject(self, @selector(backgroundContentMode));
    if (rawValue) {
        return (UIViewContentMode)rawValue.integerValue;
    }
    return UIViewContentModeScaleToFill;
}

- (void)setBackgroundContentMode:(UIViewContentMode)contentMode {
    objc_setAssociatedObject(self, @selector(backgroundContentMode), @(contentMode), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.backgroundImageView.contentMode = contentMode;
}


#pragma mark Background Image View

- (nullable UIImageView *)backgroundImageView {
    return objc_getAssociatedObject(self, @selector(backgroundImageView));
}

- (void)setBackgroundImageView:(nullable UIImageView *)backgroundImageView {
    objc_setAssociatedObject(self, @selector(backgroundImageView), backgroundImageView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


#pragma mark Setting Background Image

- (void)swizzled_setBackgroundImage:(nullable UIImage *)image forState:(UIControlState)state {
    if (self.backgroundImageView) {
        self.backgroundImageView.contentMode = self.backgroundContentMode;
        [self swizzled_setBackgroundImage:image forState:state];
        return;
    }

    NSSet *oldSubviews = [NSSet setWithArray:self.subviews];
    [self swizzled_setBackgroundImage:image forState:state];
    [self layoutIfNeeded]; // let's create background image view right now

    NSMutableSet *newSubviews = [NSMutableSet setWithArray:self.subviews];
    [newSubviews minusSet:oldSubviews];

    for (UIView *newView in newSubviews.objectEnumerator) {
        if ([newView isKindOfClass:UIImageView.class]) {
            self.backgroundImageView = (UIImageView *)newView;
            self.backgroundImageView.contentMode = self.backgroundContentMode;
            break;
        }
    }
}


@end
