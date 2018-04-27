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
@property (nonatomic,assign) NSUInteger showReferenceCount;
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
        _contentView.alpha = 0.0;
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
    if (!self.isAnimating) {
        [self hide];
    }
}

- (void)show{
    if ( ++self.showReferenceCount > 1 ){
        return;
    }
    self.hidden = NO;
    [self makeKeyAndVisible];
    self.isAnimating = YES;
    [UIView animateWithDuration:self.animationDuration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.contentView.alpha = 1.0f;
                     } completion:^(BOOL finished) {
                         if ( finished )
                         {
                             self.isAnimating = NO;
                         }
                     }];
}

- (void)hide{
    if (--self.showReferenceCount > 0){
        return;
    }
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
}

@end
