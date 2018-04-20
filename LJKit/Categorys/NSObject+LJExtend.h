//
//  NSObject+LJExtend.h
//  LJKitDemo
//
//  Created by 李建忠 on 2018/4/20.
//  Copyright © 2018年 IFlytek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LJExtend)

//判断字符串是否为空，为空的话会返回一个为YES的BOOL值 反之则返回NO
- (BOOL)lj_isBlankString:(NSString *)string;

#pragma mark - Associate value
/**
 Associate one object to `self`, as if it was a strong property (strong, nonatomic).
 */
- (void)lj_setAssociateValue:(nullable id)value withKey:(void *)key;

/**
 Associate one object to `self`, as if it was a weak property (week, nonatomic).
 */
- (void)lj_setAssociateWeakValue:(nullable id)value withKey:(void *)key;

/**
 Get the associated value from `self`.
 */
- (nullable id)lj_getAssociatedValueForKey:(void *)key;

/**
 Remove all associated values.
 */
- (void)lj_removeAssociatedValues;


@end
