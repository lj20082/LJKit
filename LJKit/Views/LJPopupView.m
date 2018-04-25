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
    self.isTouchShouldHide = NO;
    self.bgColor = LJColorHexAlpha(0x0000008f);
    self.isAllowBlurEffect = NO;
    self.blurEffectStyle = UIBlurEffectStyleDark;
}

- (void)updateConfig{
    [LJPopWindow sharedWindow].animationDuration = self.animationDuration;
    [LJPopWindow sharedWindow].isTouchShouldHide = self.isTouchShouldHide;
    if(self.isAllowBlurEffect){
        [LJPopWindow sharedWindow].contentView.backgroundColor = nil;
        [[LJPopWindow sharedWindow].contentView lj_addBlurEffect:self.blurEffectStyle];
    }else{
        [LJPopWindow sharedWindow].contentView.backgroundColor = self.bgColor;
    }
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