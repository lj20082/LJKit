//
//  UIView+LJExtend.h
//  LJKitDemo
//
//  Created by 李建忠 on 2018/4/25.
//  Copyright © 2018年 IFlytek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LJExtend)

@property (readonly, nonatomic, strong) UIVisualEffectView *lj_blurView;

// Blur效果，使用UIVisualEffectView实现
// 添加模糊效果，默认 UIBlurEffectStyle: UIBlurEffectStyleDark，alpha: 1.0
- (void)lj_addBlurEffect;

- (void)lj_addBlurEffect:(UIBlurEffectStyle)style;

- (void)lj_addBlurEffect:(UIBlurEffectStyle)style alpha:(CGFloat)alpha;

@end
