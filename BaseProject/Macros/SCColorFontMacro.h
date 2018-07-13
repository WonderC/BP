
//
//  ColorMacro.h
//  BaseProject
//
//  Created by wonderC on 2017/2/8.
//  Copyright © 2017年 wonderC. All rights reserved.
//

#ifndef SCColorFontMacro_h
#define SCColorFontMacro_h

#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED //>10

    #define RGBA(r,g,b,a) [UIColor colorWithDisplayP3Red:(r)/255. green:(g)/255. blue:(b)/255. alpha:(a)]
    #define RGB(r,g,b)    [UIColor colorWithDisplayP3Red:(r)/255. green:(g)/255. blue:(b)/255. alpha:1]
#else

    #define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255. green:(g)/255. blue:(b)/255. alpha:(a)]
    #define RGB(r,g,b)    [UIColor colorWithRed:(r)/255. green:(g)/255. blue:(b)/255. alpha:1]
#endif

//主要色值
#define kGrayColor      RGB(233,232,112)
#define KWitheColor     [UIColor whiteColor]
#define kPurpleColor    [UIColor purpleColor]
#define kLightGrayColor [UIColor lightGrayColor]
#define kOrangeColor    [UIColor orangeColor]
#define kBlueColor      [UIColor blueColor]

//字体大小
#define FONT(size)      [UIFont systemFontOfSize:(size)]
#define buttonTitleFont FONT(14)


#endif /* ColorMacro_h */
