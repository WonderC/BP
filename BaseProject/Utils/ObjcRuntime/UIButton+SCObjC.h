//
//  UIButton+SCObjC.h
//  BaseProject
//
//  Created by wonderC on 2017/3/13.
//  Copyright © 2017年 wonderC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (SCObjC)

/**
 设置button点击间隔时间
 */
@property (nonatomic,assign) NSTimeInterval timeInterval;

/**
 设置忽略的button
 */
@property (nonatomic,assign) BOOL isIgnoreButton;

@end
