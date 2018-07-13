//
//  SCTabBarViewController.h
//  BaseProject
//
//  Created by wonderC on 2017/2/9.
//  Copyright © 2017年 wonderC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCMainNavigationViewController.h"

@interface SCTabBarViewController : UITabBarController

/**
 设置TabBar的背景颜色

 @param color 背景颜色值
 */
- (void)setTabBarShadowColor:(nullable UIColor *)color;

/**
 设置TabBar最上面一条线的颜色
 
 @param color 颜色值
 */
- (void)setTabBarShadowImageColor:(nullable UIColor *)color;

@end
