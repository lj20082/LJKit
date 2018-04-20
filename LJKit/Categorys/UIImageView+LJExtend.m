//
//  UIImageView+LJExtend.m
//  LJKitDemo
//
//  Created by 李建忠 on 2018/4/20.
//  Copyright © 2018年 IFlytek. All rights reserved.
//

#import "UIImageView+LJExtend.h"
#import "UIImage+LJExtend.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation UIImageView (LJExtend)

@end

@implementation UIImageView (LJCornerRadius)
- (void)lj_loadImageUrlStr:(NSString *)urlStr{
    [self lj_loadImageUrlStr:urlStr placeHolderImageName:nil radius:CGFLOAT_MIN];
}

- (void)lj_loadImageUrlStr:(NSString *)urlStr radius:(CGFloat)radius{
    [self lj_loadImageUrlStr:urlStr placeHolderImageName:nil radius:radius];
}

- (void)lj_loadImageUrlStr:(NSString *)urlStr placeHolderImageName:(NSString *)placeHolderStr radius:(CGFloat)radius{
    //这里传CGFLOAT_MIN，就是默认以图片宽度的一半为圆角
    if (radius == CGFLOAT_MIN) {
        radius = self.frame.size.width/2.0;
    }
    NSURL *url = [NSURL URLWithString:urlStr];
    if (radius != 0.0) {
        //头像需要手动缓存处理成圆角的图片
        NSString *cacheurlStr = [urlStr stringByAppendingFormat:@"radiusCache-%f",radius];
        UIImage *cacheImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:cacheurlStr];
        if (cacheImage) {
            self.image = cacheImage;
        }
        else {
            // 尽量让UI对默认图进行处理，避免运算切除圆角
            // UIImage *placeImage = [self createRoundedRectImage:[UIImage imageNamed:placeHolderStr] size:self.frame.size radius:radius];
            UIImage *placeImage = [UIImage imageNamed:placeHolderStr];
            [self sd_setImageWithURL:url placeholderImage:placeImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                if (!error) {
                    UIImage *radiusImage = [image lj_imageWithRoundedCornersAndSize:self.frame.size cornerRadius:radius];
                    self.image = radiusImage;
                    [[SDImageCache sharedImageCache] storeImage:radiusImage forKey:cacheurlStr completion:NULL];
                    //清除原有非圆角图片缓存
                    [[SDImageCache sharedImageCache] removeImageForKey:urlStr withCompletion:NULL];
                }
            }];
        }
    }
    else {
        [self sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:placeHolderStr] completed:nil];
    }
}
@end
