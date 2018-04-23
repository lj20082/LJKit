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

// rgb颜色转换（16进制->10进制）
#define LJColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define LJRGBA(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define LJRGB(R, G, B) LJRGBA(R,G,B,1.0f)

#endif /* LJMacroDefine_h */
