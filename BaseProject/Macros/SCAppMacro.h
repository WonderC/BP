//
//  Macro.h
//  BaseProject
//
//  Created by wonderC on 2017/2/7.
//  Copyright © 2017年 wonderC. All rights reserved.
//

#ifndef SCMacro_h
#define SCMacro_h

//第三方key
#define APPID @"1060020723"

//手机型号
#define is_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define is_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define is_iPhone6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

//系统版本
#define kOSVersion [[UIDevice currentDevice].systemVersion floatValue]
#define kOS_iOS7 (OSVersion >= 7)
#define kOS_iOS8 (OSVersion >= 8)
#define kOS_iOS9 (OSVersion >= 9)
#define kOS_iOS10 (OSVersion >= 10)

//宏定义屏幕宽度和高度
#define KScreenSize    [UIScreen mainScreen].bounds.size
#define KScreenHeight  KScreenSize.height
#define KScreenWidth   KScreenSize.width

//自定义打印
#if DEBUG
    #define SCLog(fmt, ...) NSLog((@"\n\n--------------\n[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
    #define SCLog(fmt, ...) /* */;
#endif

//TabBar高度
#define kCONTENT_TabBar_HEIGHT 49
#define kSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define kSCREEEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//Navigation High
#define kNavigationHeight 44

//系统
#define SCAppDelegate [[UIApplication  sharedApplication] delegate]

#endif /* Macro_h */
