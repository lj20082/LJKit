//
//  UIColor+LJExtend.m
//  LJKitDemo
//
//  Created by 李建忠 on 2018/4/24.
//  Copyright © 2018年 IFlytek. All rights reserved.
//

#import "UIColor+LJExtend.h"

@implementation UIColor (LJExtend)

- (NSString *)lj_hexString {
    return [self lj_hexStringWithAlpha:NO];
}

- (NSString *)lj_hexStringWithAlpha {
    return [self lj_hexStringWithAlpha:YES];
}

- (NSString *)lj_hexStringWithAlpha:(BOOL)withAlpha {
    CGColorRef color = self.CGColor;
    size_t count = CGColorGetNumberOfComponents(color);
    const CGFloat *components = CGColorGetComponents(color);
    static NSString *stringFormat = @"%02x%02x%02x";
    NSString *hex = nil;
    if (count == 2) {
        NSUInteger white = (NSUInteger)(components[0] * 255.0f);
        hex = [NSString stringWithFormat:stringFormat, white, white, white];
    } else if (count == 4) {
        hex = [NSString stringWithFormat:stringFormat,
               (NSUInteger)(components[0] * 255.0f),
               (NSUInteger)(components[1] * 255.0f),
               (NSUInteger)(components[2] * 255.0f)];
    }
    
    if (hex && withAlpha) {
        hex = [hex stringByAppendingFormat:@"%02lx",
               (unsigned long)(self.lj_alpha * 255.0 + 0.5)];
    }
    return hex;
}

- (CGFloat)lj_alpha {
    return CGColorGetAlpha(self.CGColor);
}

@end
