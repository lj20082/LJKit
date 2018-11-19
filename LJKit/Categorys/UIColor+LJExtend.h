//
//  UIColor+LJExtend.h
//  LJKitDemo
//
//  Created by 建忠 on 2018/11/16.
//  Copyright © 2018 建忠. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 获取颜色，从R G B（范围为0-255），A(范围0-1)
#define LJColorRGBA(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]
// 获取颜色，从R G B,每位范围为0-255
#define LJColorRGB(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]

// 获取颜色，rgbValue是16进制数字，eg. 0xff1233
#define LJColorHexValue(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// 获取颜色，rgbValue是16进制数字，eg. 0xff1233 ,alpha 是CGFloat类型，eg. 0.5
#define LJColorHexAlphaValue(rgbValue,A) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:A]
// 获取颜色, hexString是十六进制字符串，eg. 支持@“#123456”、 @“0X123456”、 @“123456”三种格式
#define LJColorHexString(hexString) [UIColor lj_colorWithHexString:hexString]
// 获取颜色, hexString是十六进制字符串，eg. 支持@“#123456”、 @“0X123456”、 @“123456”三种格式, alpha 是CGFloat类型，eg. 0.5
#define LJColorHexStringAlpha(hexString,A) [UIColor lj_colorWithHexString:hexString alpha:A]

@interface UIColor (LJExtend)

+ (UIColor *)lj_colorWithHexString:(NSString *)color;
//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)lj_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
