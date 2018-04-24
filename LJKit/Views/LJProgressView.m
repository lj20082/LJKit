//
//  LJProgressView.m
//  LJKitDemo
//
//  Created by 李建忠 on 2018/4/24.
//  Copyright © 2018年 IFlytek. All rights reserved.
//

#import "LJProgressView.h"

@interface LJProgressView ()
@property (strong, nonatomic) UIView *progressBarView;
@property (strong, nonatomic) UIView *bufferBarView;
@end

@implementation LJProgressView

- (id)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self configureViews];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self configureViews];
}

- (void)configureViews{
    _progressBarColor = [UIColor colorWithRed:22.f / 255.f green:126.f / 255.f blue:251.f / 255.f alpha:1.0];
    _fadeAnimationDuration = 0.27f;
    _fadeOutDelay = 0.1f;
    _barAnimationDuration = _bufferAnimationDuration = 0.27;
    _isAutoHide = YES;
    self.userInteractionEnabled = NO;
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _progressBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, self.bounds.size.height)];
    _progressBarView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _progressBarView.backgroundColor = _progressBarColor;
    [self addSubview:_progressBarView];
}

- (void)setProgress:(CGFloat)progress{
    [self setProgress:progress animated:NO];
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated{
    _progress = progress;
    BOOL isGrowing = progress > 0.0;
    __weak __typeof(self) wSelf = self;
    if(_progress <= 1.0){
        [UIView animateWithDuration:(isGrowing && animated) ? _barAnimationDuration : 0.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            __strong __typeof(self) sSelf = wSelf;
            CGRect frame = sSelf.progressBarView.frame;
            frame.size.width = progress * self.bounds.size.width;
            sSelf.progressBarView.frame = frame;
        } completion:nil];
    }
    if (progress >= 1.0) {
        if(!_isAutoHide) return;
        [UIView animateWithDuration:animated ? _fadeAnimationDuration : 0.0 delay:_fadeOutDelay options:UIViewAnimationOptionCurveEaseInOut animations:^{
            __strong __typeof(self) sSelf = wSelf;
            sSelf.progressBarView.alpha = 0.0;
            sSelf.bufferBarView.alpha = 0.0;
        } completion:^(BOOL completed){
             __strong __typeof(self) sSelf = wSelf;
            CGRect frame = sSelf.progressBarView.frame;
            frame.size.width = 0;
            sSelf.progressBarView.frame = frame;
            CGRect bufferBarFrame = sSelf.bufferBarView.frame;
            bufferBarFrame.size.width = 0;
            sSelf.bufferBarView.frame = bufferBarFrame;
        }];
    }
    else {
        [UIView animateWithDuration:animated ? _fadeAnimationDuration : 0.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            __strong __typeof(self) sSelf = wSelf;
            sSelf.progressBarView.alpha = 1.0;
            sSelf.bufferBarView.alpha = 1.0;
        } completion:nil];
    }
}

- (void)setBufferProgress:(CGFloat)bufferProgress{
    [self setBufferProgress:bufferProgress animated:NO];
}

- (void)setBufferProgress:(CGFloat)bufferProgress animated:(BOOL)animated{
    _bufferProgress = bufferProgress;
    if(_bufferProgress > 1.0) return;
    BOOL isGrowing = bufferProgress > 0.0;
    __weak __typeof(self) wSelf = self;
    [UIView animateWithDuration:(isGrowing && animated) ? _bufferAnimationDuration : 0.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        __strong __typeof(self) sSelf = wSelf;
        CGRect frame = sSelf.bufferBarView.frame;
        frame.size.width = bufferProgress * self.bounds.size.width;
        sSelf.bufferBarView.frame = frame;
    } completion:nil];
}

- (void)setProgressBarColor:(UIColor *)progressBarColor{
    _progressBarColor = progressBarColor;
    _progressBarView.backgroundColor = _progressBarColor;
}

- (void)setBufferBarColor:(UIColor *)bufferBarColor{
    _bufferBarColor = bufferBarColor;
    if(!_bufferBarView){
        _bufferBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, self.bounds.size.height)];
        _bufferBarView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self insertSubview:_bufferBarView belowSubview:_progressBarView];
    }
    _bufferBarView.backgroundColor = _bufferBarColor;
}

@end
