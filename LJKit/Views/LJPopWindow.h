//
//  LJPopWindow.h
//  LJKitDemo
//
//  Created by 李建忠 on 2018/4/25.
//  Copyright © 2018年 IFlytek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJPopWindow : UIWindow

// 容器view
@property (strong, nonatomic) UIView *contentView;
// 是否触摸背景隐藏pop视图，默认为NO
@property (nonatomic,assign) BOOL isTouchBackgroundShouldHide;
// 是否触摸视图本身隐藏,默认为NO
@property (nonatomic,assign) BOOL isTouchSelfShouldHide;
// 动画时长
@property (nonatomic,assign) NSTimeInterval animationDuration;
// 是否动画中
@property (nonatomic,assign) BOOL isAnimating;

+ (instancetype)sharedWindow;

- (void)show;

- (void)hide;

@end
