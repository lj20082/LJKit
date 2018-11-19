//
//  NSFileManager+LJExtend.m
//  LJKitDemo
//
//  Created by 李建忠 on 2018/5/10.
//  Copyright © 2018年 IFlytek. All rights reserved.
//

#import "NSFileManager+LJExtend.h"

@implementation NSFileManager (LJExtend)

+ (long long)lj_fileSizeOfFile:(NSString *)filePath{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:filePath]) { return 0; }
    NSDictionary *fileAttributes = [fileManager attributesOfItemAtPath:filePath error:nil];
    return [(NSNumber*)[fileAttributes objectForKey: NSFileSize] longLongValue];
}

@end
