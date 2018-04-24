//
//  LJProgressView.h
//  LJKitDemo
//
//  Created by 李建忠 on 2018/4/24.
//  Copyright © 2018年 IFlytek. All rights reserved.
//

/***  使用demo

 // 初始化 或者 从xib、storyboard 初始化
 LJProgressView *v = [[LJProgressView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
 v.isAutoHide = NO;
 v.progressBarColor = [UIColor redColor];
 v.bufferBarColor = [UIColor grayColor];
 [self.view addSubview:v];
 
 // 进度改变是调用
 [v setProgress:xx animated:NO];
 [v setBufferProgress:xxx];
 
 */

#import <UIKit/UIKit.h>

@interface LJProgressView : UIView

@property (nonatomic,assign) CGFloat progress;
@property (nonatomic,assign) CGFloat bufferProgress;

// 进度条单次动画时间 default 0.27
@property (nonatomic,assign) NSTimeInterval barAnimationDuration;
// 缓冲进度条动画时间 default 0.27
@property (nonatomic,assign) NSTimeInterval bufferAnimationDuration;

// 淡入淡出设置，若不需要可设置为0
@property (nonatomic,assign) NSTimeInterval fadeAnimationDuration; // default 0.27
@property (nonatomic,assign) NSTimeInterval fadeOutDelay; //default 0.1

// 进度条颜色，默认为 [UIColor colorWithRed:22.f / 255.f green:126.f / 255.f blue:251.f / 255.f alpha:1.0],iOS7 Safari bar color
@property (strong, nonatomic) UIColor *progressBarColor;

// 缓冲进度条颜色，未设置则不初始化缓冲进度条
@property (strong, nonatomic) UIColor *bufferBarColor;

// 进度到1后是否自动隐藏，默认YES
@property (nonatomic,assign) BOOL isAutoHide;

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;
- (void)setBufferProgress:(CGFloat)bufferProgress animated:(BOOL)animated;
@end
