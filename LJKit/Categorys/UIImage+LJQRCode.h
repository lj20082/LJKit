//
//  UIImage+LJQRCode.h
//  LJKitDemo
//
//  Created by Jake on 2019/8/9.
//  Copyright © 2019 建忠. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (LJQRCode)

+ (UIImage *)lj_generateQRCodeWithData:(NSString *)data size:(CGFloat)size;

@end

NS_ASSUME_NONNULL_END
