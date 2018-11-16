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

// 判断是否是iPhoneX系列(xs max/xr 414*896 , xs/x 375*812)
#define LJ_IsIPhoneXSeries ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?\
(CGSizeEqualToSize(CGSizeMake(375.f, 812.f),[UIScreen mainScreen].bounds.size)||CGSizeEqualToSize(CGSizeMake(812.f, 375.f),[UIScreen mainScreen].bounds.size)||CGSizeEqualToSize(CGSizeMake(414.f, 896.f),[UIScreen mainScreen].bounds.size)||CGSizeEqualToSize(CGSizeMake(896.f, 414.f),[UIScreen mainScreen].bounds.size)):NO)

// Status bar height.
#define LJ_StatusBarHeight (LJ_IsIPhoneXSeries ? 44.f : 20.f)
// Navigation bar height.
#define LJ_NavigationBarHeight  44.f
// Tabbar safe bottom margin.
#define LJ_TabbarSafeBottomMargin (LJ_IsIPhoneXSeries ? 34.f : 0.f)
// Status bar & navigation bar height.
#define LJStatusBarAndNavigationBarHeight  (LJ_IsIPhoneXSeries ? 88.f : 64.f)

#define LJViewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})

#endif /* LJMacroDefine_h */
