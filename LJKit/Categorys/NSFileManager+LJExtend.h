//
//  NSFileManager+LJExtend.h
//  LJKitDemo
//
//  Created by 李建忠 on 2018/5/10.
//  Copyright © 2018年 IFlytek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (LJExtend)

+ (long long)lj_fileSizeOfFile:(NSString *)filePath;

@end
