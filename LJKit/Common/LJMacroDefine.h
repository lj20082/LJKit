//
//  LJMacroDefine.h
//  LJKitDemo
//
//  Created by 李建忠 on 2018/4/23.
//  Copyright © 2018年 IFlytek. All rights reserved.
//

#ifndef LJMacroDefine_h
#define LJMacroDefine_h

#define LJStoryboard(sbName) [UIStoryboard storyboardWithName:sbName bundle:[NSBundle mainBundle]]
#define LJStoryboardViewController(sbName, class) [LJStoryboard(sbName) instantiateViewControllerWithIdentifier:NSStringFromClass(class)]
#define LJBindClassCell(table, class) [table registerClass:class forCellReuseIdentifier:NSStringFromClass(class)]
#define LJBindNibCell(table, class) [table registerNib:[UINib nibWithNibName:NSStringFromClass(class) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass(class)]
#define LJFetchCell(table, class) [table dequeueReusableCellWithIdentifier:NSStringFromClass(class)]
#define LJNibViewWithName(name) [[[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil] firstObject]
#define LJNibViewWithClass(class) LJNibViewWithName(NSStringFromClass(class))

#define LJBindNibCells(table,bindCells) do{\
[bindCells enumerateObjectsUsingBlock:^(Class  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {\
[table registerNib:[UINib nibWithNibName:NSStringFromClass(obj) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass(obj)];\
}];\
}while (0)

// APP版本号
#define LJAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
// 系统版本号
#define LJSystemVersion [[UIDevice currentDevice] systemVersion]
// 沙盒Document路径
#define LJDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
// 沙盒temp路径
#define LJTempPath NSTemporaryDirectory()
// 获取沙盒Cache路径
#define LJCachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
// 获取屏幕 宽度、高度
#define LJ_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define LJ_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
// 判断是否是iPhoneX
#define LJ_IsIPhoneX (CGSizeEqualToSize(CGSizeMake(375.f, 812.f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(812.f, 375.f), [UIScreen mainScreen].bounds.size))
// Status bar height.
#define LJ_StatusBarHeight (LJ_IsIPhoneX ? 44.f : 20.f)
// Navigation bar height.
#define LJ_NavigationBarHeight  44.f
// Tabbar safe bottom margin.
#define LJ_TabbarSafeBottomMargin (LJ_IsIPhoneX ? 34.f : 0.f)
// Status bar & navigation bar height.
#define LJStatusBarAndNavigationBarHeight  (LJ_IsIPhoneX ? 88.f : 64.f)

#define LJViewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})

// 获取颜色，从hex color，eg. 0xff1233
#define LJColorHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
// 获取颜色，从hex alpha color，eg. 0x00000080 黑色，50% alpha
#define LJColorHexAlpha(rgbaValue) [UIColor colorWithRed:((float)((rgbaValue & 0xFF000000) >> 24))/255.0 green:((float)((rgbaValue & 0xFF0000) >> 16))/255.0 blue:((float)((rgbaValue & 0xFF00) >> 8))/255.0 alpha:((float)(rgbaValue & 0xFF))/255.0]
// 获取颜色，从hex color,alpha
#define LJColorHexA(rgbValue,A) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:A]

// 获取颜色，从R G B（范围为0-255），A(范围0-1)
#define LJColorRGBA(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
// 获取颜色，从R G B,每位范围为0-255
#define LJColorRGB(R, G, B) LJRGBA(R,G,B,1.0f)

#endif /* LJMacroDefine_h */
