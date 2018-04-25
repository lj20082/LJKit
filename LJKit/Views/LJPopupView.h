//
//  LJPopupView.h
//  LJKitDemo
//
//  Created by 李建忠 on 2018/4/25.
//  Copyright © 2018年 IFlytek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJPopupView : UIView
// 动画时长
@property (nonatomic,assign) NSTimeInterval animationDuration;
// 是否触摸背景隐藏pop视图，默认为NO
@property (nonatomic,assign) BOOL isTouchShouldHide;
// 背景色，默认为0x0000008f，当isAllowBlurEffect为NO时生效
@property (strong, nonatomic) UIColor *bgColor;
// 是否使用blur效果，默认为NO
@property (nonatomic,assign) BOOL isAllowBlurEffect;
// blur类型
@property (nonatomic,assign) UIBlurEffectStyle blurEffectStyle;

- (void)show;

- (void)hide;

@end
