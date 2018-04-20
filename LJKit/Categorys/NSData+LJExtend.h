//
//  NSData+LJExtend.h
//  LJKitDemo
//
//  Created by 李建忠 on 2018/4/20.
//  Copyright © 2018年 IFlytek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (LJExtend)

// 返回utf8编码的字符串
- (NSString *)lj_utf8String;
// 返回小写的md5值
- (NSString *)lj_md5String;
// 对data进行base64编码，返回编码后的字符串
- (NSString *)lj_base64EncodedString;
// 从base64编码的字符串转换为data
+ (NSData *)lj_dataWithBase64EncodedString:(NSString *)base64EncodedString;
// 转data到json对象
- (id)lj_jsonObject;

@end
