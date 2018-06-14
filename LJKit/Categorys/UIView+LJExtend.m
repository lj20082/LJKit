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

- (CGFloat)lj_x {
    return self.frame.origin.x;
}
- (void)setLj_x:(CGFloat)lj_x{
    CGRect rect = self.frame;
    rect.origin.x = lj_x;
    self.frame = rect;
}

- (CGFloat)lj_y {
    return self.frame.origin.y;
}

- (void)setLj_y:(CGFloat)lj_y{
    CGRect rect = self.frame;
    rect.origin.y = lj_y;
    self.frame = rect;
}

- (CGFloat)lj_centerX{
    return self.center.x;
}

- (void)setLj_centerX:(CGFloat)lj_centerX{
    CGPoint center = self.center;
    center.x = lj_centerX;
    self.center = center;
}

- (CGFloat)lj_centerY{
    return self.center.y;
}

- (void)setLj_centerY:(CGFloat)lj_centerY{
    CGPoint center = self.center;
    center.y = lj_centerY;
    self.center = center;
}

- (CGFloat)lj_width {
    return self.frame.size.width;
}

- (void)setLj_width:(CGFloat)lj_width {
    CGRect rect = self.frame;
    rect.size.width = lj_width;
    self.frame = rect;
}

- (CGFloat)lj_height {
    return self.frame.size.height;
}

- (void)setLj_height:(CGFloat)lj_height {
    CGRect rect = self.frame;
    rect.size.height = lj_height;
    self.frame = rect;
}

- (CGPoint)lj_origin {
    return self.frame.origin;
}

- (void)setLj_origin:(CGPoint)lj_origin {
    CGRect rect = self.frame;
    rect.origin = lj_origin;
    self.frame = rect;
}

- (CGSize)lj_size {
    return self.frame.size;
}

- (void)setLj_size:(CGSize)lj_size {
    CGRect rect = self.frame;
    rect.size = lj_size;
    self.frame = rect;
}

- (CGFloat)lj_maxY {
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)lj_maxX{
    return CGRectGetMaxX(self.frame);
}

- (UIImage *)lj_snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

- (UIImage *)lj_snapshotImageAfterScreenUpdates:(BOOL)afterUpdates {
    if (![self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        return [self lj_snapshotImage];
    }
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:afterUpdates];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}
@end
