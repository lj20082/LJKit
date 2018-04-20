//
//  NSString+LJExtend.h
//  LJKitDemo
//
//  Created by 李建忠 on 2018/4/20.
//  Copyright © 2018年 IFlytek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (LJExtend)

// url编码
- (NSString *)lj_stringByURLEncode;
// url解码
- (NSString *)lj_stringByURLDecode;
// 返回小写的md5值
- (NSString *)lj_md5String;
// base64编码
- (NSString *)lj_base64EncodedString;
// 转string到json对象
- (id)lj_jsonObject;
// 转string到data,通过UTF-8编码
- (NSData *)lj_dataValue;
// 单行字符串长度
- (CGFloat)lj_widthForFont:(UIFont *)font;
// 字符串高度
- (CGFloat)lj_heightForFont:(UIFont *)font width:(CGFloat)width;

@end
