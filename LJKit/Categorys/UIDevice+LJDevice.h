//
//  UIDevice+LJDevice.h
//  LJKitDemo
//
//  Created by 建忠 on 2018/9/26.
//  Copyright © 2018年 建忠. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (LJDevice)

+ (NSString *)lj_deviceModel;
// 获取设备总空间，单位byte
+ (unsigned long long)lj_deviceTotalDiskSize;
// 获取设备空闲空间,单位byte
+ (unsigned long long)lj_deviceFreeDiskSize;

@end

NS_ASSUME_NONNULL_END
