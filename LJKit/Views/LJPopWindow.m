//
//  LJPopWindow.m
//  LJKitDemo
//
//  Created by 李建忠 on 2018/4/25.
//  Copyright © 2018年 IFlytek. All rights reserved.
//

#import "LJPopWindow.h"
#import "UIView+LJExtend.h"
#import "LJPopupView.h"

@interface LJPopWindow ()<UIGestureRecognizerDelegate>

@end

@implementation LJPopWindow

+ (instancetype)sharedWindow{
    static LJPopWindow *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    });
    return sharedInstance;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.windowLevel = UIWindowLevelStatusBar + 1;
        self.rootViewController = [[UIViewController alloc] init];
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        gesture.cancelsTouchesInView = NO;
        gesture.delegate = self;
        [self addGestureRecognizer:gesture];
        self.contentView = [[UIView alloc] initWithFrame:frame];
        [self.rootViewController.view addSubview:_contentView];
    }
    return self;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if (self.isTouchBackgroundShouldHide) {
        return touch.view == self.contentView || touch.view == self.contentView.lj_blurView;
    }
    if (self.isTouchSelfShouldHide){
        return [touch.view isKindOfClass:[LJPopupView class]];
    }
    return NO;
    
}

- (void)tapAction:(UITapGestureRecognizer *)gesture{
    [self hide];
}

- (void)show{
    [self showAnimate:YES];
}

- (void)hide{
    [self hideAnimate:YES];
}

- (void)showAnimate:(BOOL)animate{
    if (!self.hidden || self.isAnimating) return;
    if (animate) {
        self.contentView.alpha = 0.0f;
        self.hidden = NO;
        [self makeKeyAndVisible];
        self.isAnimating = YES;
        [UIView animateWithDuration:self.animationDuration
                              delay:0
                            options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             self.contentView.alpha = 1.0f;
                         } completion:^(BOOL finished) {
                            self.isAnimating = NO;
                         }];
    }else{
        self.contentView.alpha = 1.0f;
        self.hidden = NO;
        [self makeKeyAndVisible];
    }
}

- (void)hideAnimate:(BOOL)animate{
    if(self.hidden || self.isAnimating) return;
    if (animate) {
        self.isAnimating = YES;
        [UIView animateWithDuration:self.animationDuration
                              delay:0
                            options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             self.contentView.alpha = 0.0f;
                         } completion:^(BOOL finished) {
                             if ( finished ){
                                 self.hidden = YES;
                                 [[[UIApplication sharedApplication].delegate window] makeKeyWindow];
                                 self.isAnimating = NO;
                                 [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                             }
                         }];
    }else{
        self.hidden = YES;
        [[[UIApplication sharedApplication].delegate window] makeKeyWindow];
        [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
}

@end
