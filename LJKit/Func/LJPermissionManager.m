//
//  LJPermissionManager.m
//  LJKitDemo
//
//  Created by 建忠 on 2018/11/19.
//  Copyright © 2018 建忠. All rights reserved.
//

#import "LJPermissionManager.h"
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>
#import <Contacts/Contacts.h>

@implementation LJPermissionManager

+ (void)requestMicrophoneAuthorizationIfNeededWithResultHandler:(void (^)(BOOL))resultHandler
{
    AVAuthorizationStatus videoAuthStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    if (videoAuthStatus == AVAuthorizationStatusNotDetermined) {// 未询问用户是否授权
        //第一次询问用户是否进行授权
        [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (resultHandler) resultHandler(granted);
            });
        }];
    }else if(videoAuthStatus == AVAuthorizationStatusRestricted || videoAuthStatus == AVAuthorizationStatusDenied) {// 未授权
        if (resultHandler) resultHandler(NO);
    }else {// 已授权
        if (resultHandler) resultHandler(YES);
    }
}

+ (void)requsetCameraAuthorizationIfNeededWithResultHandler:(void(^)(BOOL granted))resultHandler{
    AVAuthorizationStatus videoAuthStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (videoAuthStatus == AVAuthorizationStatusNotDetermined) {// 未询问用户是否授权
        //第一次询问用户是否进行授权
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (resultHandler) resultHandler(granted);
            });
        }];
    }else if(videoAuthStatus == AVAuthorizationStatusRestricted || videoAuthStatus == AVAuthorizationStatusDenied) {// 未授权
        if (resultHandler) resultHandler(NO);
    }else {// 已授权
        if (resultHandler) resultHandler(YES);
    }
}

+ (void)requsetPhotoAlbumAuthorizationIfNeededWithResultHandler:(void(^)(BOOL granted))resultHandler{
    PHAuthorizationStatus authStatus = [PHPhotoLibrary authorizationStatus];
    if (authStatus == PHAuthorizationStatusNotDetermined){
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (resultHandler) resultHandler(status == PHAuthorizationStatusAuthorized);
            });
        }];
    }else if (authStatus == PHAuthorizationStatusRestricted || authStatus == PHAuthorizationStatusDenied){
        if (resultHandler) resultHandler(NO);
    }else{
        if (resultHandler) resultHandler(YES);
    }
}

+ (void)requsetContactsAuthorizationIfNeededWithResultHandler:(void(^)(BOOL granted))resultHandler{
    CNAuthorizationStatus authStatus = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    if (authStatus == CNAuthorizationStatusNotDetermined) {
        CNContactStore *contactStore = [[CNContactStore alloc] init];
        [contactStore requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (resultHandler) resultHandler(granted);
            });
        }];
    }else if (authStatus == CNAuthorizationStatusRestricted || authStatus == CNAuthorizationStatusDenied){
        if (resultHandler) resultHandler(NO);
    }else{
        if (resultHandler) resultHandler(YES);
    }
}

+ (void)goToSettingPanel{
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if([[UIApplication sharedApplication] canOpenURL:url]) {
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication] openURL:url];
    }
}

@end
