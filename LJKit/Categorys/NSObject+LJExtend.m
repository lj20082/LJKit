//
//  NSObject+LJExtend.m
//  LJKitDemo
//
//  Created by 李建忠 on 2018/4/20.
//  Copyright © 2018年 IFlytek. All rights reserved.
//

#import "NSObject+LJExtend.h"
#import <objc/runtime.h>

@implementation NSObject (LJExtend)

- (BOOL)lj_isBlankString:(NSString *)string{
    if (string == nil || string == NULL){
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]){
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

- (void)lj_setAssociateValue:(id)value withKey:(void *)key {
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)lj_setAssociateWeakValue:(id)value withKey:(void *)key {
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_ASSIGN);
}

- (void)lj_removeAssociatedValues {
    objc_removeAssociatedObjects(self);
}

- (id)lj_getAssociatedValueForKey:(void *)key {
    return objc_getAssociatedObject(self, key);
}
@end
