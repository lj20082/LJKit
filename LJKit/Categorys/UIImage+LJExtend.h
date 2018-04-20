//
//  UIImage+LJExtend.h
//  LJKitDemo
//
//  Created by 李建忠 on 2018/4/20.
//  Copyright © 2018年 IFlytek. All rights reserved.
//

#import <UIKit/UIKit.h>

// 已完成 旋转、缩放、圆角、边框、颜色初始化
// to do 裁剪、模糊、存储

@interface UIImage (LJExtend)

/**
 通过颜色初始化图片

 @param color 颜色值
 @return 初始化的图片，默认大小1*1像素
 */
+ (nullable UIImage *)lj_imageWithColor:(UIColor *)color;

/**
 通过颜色初始化图片

 @param color 颜色值
 @param size 图片大小
 @return 初始化后的图片
 */
+ (UIImage *)lj_imageWithColor:(UIColor *)color size:(CGSize)size;


/**
 图片圆角处理

 @param radius 圆角弧度
 @return 处理后的图片
 */
- (nullable UIImage *)lj_imageByRoundCornerRadius:(CGFloat)radius;

/**
 图片圆角、边框处理

 @param radius 圆角弧度
 @param borderWidth 边框宽度
 @param borderColor 边框颜色
 @return 处理后的图片
 */
- (nullable UIImage *)lj_imageByRoundCornerRadius:(CGFloat)radius
                                   borderWidth:(CGFloat)borderWidth
                                   borderColor:(nullable UIColor *)borderColor;

/**
 图片圆角、边框处理 - 更多设置

 @param radius 圆角弧度
 @param corners 边框配置
 @param borderWidth 边框宽度
 @param borderColor 边框颜色
 @param borderLineJoin 连接类型
 @return 处理后的图片
 */
- (nullable UIImage *)lj_imageByRoundCornerRadius:(CGFloat)radius
                                       corners:(UIRectCorner)corners
                                   borderWidth:(CGFloat)borderWidth
                                   borderColor:(nullable UIColor *)borderColor
                                borderLineJoin:(CGLineJoin)borderLineJoin;

/**
 左转 (90°). ⤺，宽高会交换
 宽高会发生改变
 */
- (nullable UIImage *)lj_imageByRotateLeft90;

/**
 右转 (90°). ⤼ ，宽高会交换
 */
- (nullable UIImage *)lj_imageByRotateRight90;

/**
 旋转 180° . ↻
 */
- (nullable UIImage *)lj_imageByRotate180;


/**
 修正UIImage方向 （UIImagePickerController 拍照生成照片上传后方向不对的修正）

 @return 处理后的图片
 */
- (UIImage *)lj_imageByFixOrientation;

/**
 *  保持比例，放大或者缩小UIImage
 *
 *  @param width 放大或者缩小后的宽度
 *
 */
- (nullable UIImage *)lj_scaledImageByWidth:(CGFloat)width;

/**
 *  保持比例，放大或者缩小UIImage
 *
 *  @param height 放大或者缩小后的高度
 *
 */
- (nullable UIImage *)lj_scaledImageByHeight:(CGFloat)height;

@end
