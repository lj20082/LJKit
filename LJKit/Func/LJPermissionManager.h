//
//  LJPermissionManager.h
//  LJKitDemo
//
//  Created by 建忠 on 2018/11/19.
//  Copyright © 2018 建忠. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LJPermissionManager : NSObject

// 请求麦克风权限
+ (void)requestMicrophoneAuthorizationIfNeededWithResultHandler:(void(^)(BOOL granted))resultHandler;
// 请求相机权限
+ (void)requsetCameraAuthorizationIfNeededWithResultHandler:(void(^)(BOOL granted))resultHandler;
// 请求相册权限
+ (void)requsetPhotoAlbumAuthorizationIfNeededWithResultHandler:(void(^)(BOOL granted))resultHandler;
// 请求联系人权限
+ (void)requsetContactsAuthorizationIfNeededWithResultHandler:(void(^)(BOOL granted))resultHandler;
// 前往设置页面
+ (void)goToSettingPanel;

@end

NS_ASSUME_NONNULL_END
