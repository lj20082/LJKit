//
//  UIView+LJExtend.m
//  LJKitDemo
//
//  Created by 李建忠 on 2018/4/25.
//  Copyright © 2018年 IFlytek. All rights reserved.
//

#import "UIView+LJExtend.h"
#import <objc/runtime.h>

@implementation UIView (LJExtend)

- (UIVisualEffectView *)lj_blurView{
    UIVisualEffectView *lj_blurView = objc_getAssociatedObject(self, @selector(lj_blurView));
    if (!lj_blurView ){
        lj_blurView = [[UIVisualEffectView alloc] init];
        objc_setAssociatedObject(self, @selector(lj_blurView), lj_blurView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return lj_blurView;
}

- (void)lj_addBlurEffect{
    [self lj_addBlurEffect:UIBlurEffectStyleDark alpha:1.0];
}

- (void)lj_addBlurEffect:(UIBlurEffectStyle)style{
    [self lj_addBlurEffect:style alpha:1.0];
}

- (void)lj_addBlurEffect:(UIBlurEffectStyle)style alpha:(CGFloat)alpha{
    self.lj_blurView.frame = self.frame;
    self.lj_blurView.alpha = alpha;
    self.lj_blurView.effect = [UIBlurEffect effectWithStyle:style];
    [self addSubview:self.lj_blurView];
}

@end
