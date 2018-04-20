//
//  UIImageView+LJExtend.h
//  LJKitDemo
//
//  Created by 李建忠 on 2018/4/20.
//  Copyright © 2018年 IFlytek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (LJExtend)

@end


/* 内部使用SDWebImage实现图片的下载缓存机制 */
@interface UIImageView (LJCornerRadius)

// 未设置radius默认裁剪为圆形
- (void)lj_loadImageUrlStr:(NSString *)urlStr;

// 未设置placeHolderImageName则无占位图
- (void)lj_loadImageUrlStr:(NSString *)urlStr radius:(CGFloat)radius;

/**
 加载网络图片-有弧度
 
 @param urlStr 图片地址
 @param placeHolderStr 占位图地址，未设置则无占位图
 @param radius 弧度,radius = CGFLOAT_MIN裁剪为圆形
 */
- (void)lj_loadImageUrlStr:(NSString *)urlStr placeHolderImageName:(NSString *)placeHolderStr radius:(CGFloat)radius;

@end
