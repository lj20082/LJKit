//
//  NSTimer+LJExtend.m
//  LJKitDemo
//
//  Created by 李建忠 on 2018/4/20.
//  Copyright © 2018年 IFlytek. All rights reserved.
//

#import "NSTimer+LJExtend.h"

@implementation NSTimer (LJExtend)

+ (NSTimer *)lj_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void(^)(NSTimer * _Nonnull timer))block
{
    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(lj_blockInvoke:)
                                       userInfo:[block copy]
                                        repeats:repeats];
}

+ (void)lj_blockInvoke:(NSTimer *)timer
{
    void(^block)(NSTimer * _Nonnull timer) = timer.userInfo;
    
    if (block != NULL)
    {
        block(timer);
    }
}

@end
