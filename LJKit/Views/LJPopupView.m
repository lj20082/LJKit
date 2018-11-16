//
//  LJPopupView.m
//  LJKitDemo
//
//  Created by 李建忠 on 2018/4/25.
//  Copyright © 2018年 IFlytek. All rights reserved.
//

#import "LJPopupView.h"
#import "LJPopWindow.h"
#import "LJMacroDefine.h"
#import "UIView+LJExtend.h"
#import "UIColor+LJExtend.h"

@implementation LJPopupView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self resetConfig];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self resetConfig];
}

- (void)resetConfig{
    self.animationDuration = 0.3f;
    self.isTouchSelfShouldHide = self.isTouchBackgroundShouldHide = NO;
    self.bgColor = LJColorHexAlphaValue(0x000000, 0.56);
    self.isAllowBlurEffect = NO;
    self.blurEffectStyle = UIBlurEffectStyleDark;
}

- (void)updateConfig{
    [LJPopWindow sharedWindow].animationDuration = self.animationDuration;
    [LJPopWindow sharedWindow].isTouchBackgroundShouldHide = self.isTouchBackgroundShouldHide;
    [LJPopWindow sharedWindow].isTouchSelfShouldHide = self.isTouchSelfShouldHide;
    if(self.isAllowBlurEffect){
        [LJPopWindow sharedWindow].contentView.backgroundColor = nil;
        [[LJPopWindow sharedWindow].contentView lj_addBlurEffect:self.blurEffectStyle];
    }else{
        [LJPopWindow sharedWindow].contentView.backgroundColor = self.bgColor;
    }
}

- (void)showAnimate:(BOOL)animate{
    [self updateConfig];
    [[LJPopWindow sharedWindow].contentView addSubview:self];
    [[LJPopWindow sharedWindow] showAnimate:animate];
}

- (void)hideAnimate:(BOOL)animate{
    [self resetConfig];
    [[LJPopWindow sharedWindow] hideAnimate:YES];
}

- (void)show{
    [self updateConfig];
    [[LJPopWindow sharedWindow].contentView addSubview:self];
    [[LJPopWindow sharedWindow] show];
}

- (void)hide{
    [self resetConfig];
    [[LJPopWindow sharedWindow] hide];
}

@end
