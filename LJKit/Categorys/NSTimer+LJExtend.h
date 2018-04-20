//
//  NSTimer+LJExtend.h
//  LJKitDemo
//
//  Created by 李建忠 on 2018/4/20.
//  Copyright © 2018年 IFlytek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (LJExtend)

/**
 防止timer循环引用

 @param interval 时间间隔
 @param repeats 是否重复
 @param block 回调
 @return timer实例
 */
+ (NSTimer *_Nonnull)lj_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                                repeats:(BOOL)repeats
                                                  block:(void(^_Nonnull)(NSTimer * _Nonnull timer))block;
@end
