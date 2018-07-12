//
//  AppDelegate.h
//  BaseProject
//
//  Created by wonderC on 2017/2/7.
//  Copyright © 2017年 wonderC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCTabBarViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong) SCTabBarViewController *tabbarController;

@property (nonatomic,assign) BOOL isShow;

#pragma mark - change root viewcontroller
/**
 设置登录页面
 */
- (void)setupLoginViewController;

/**
 设置tabbar的选项卡
 */
- (void)setupTabbarViewController;

/**
 不使用tabbar的情况下
 */
- (void)setupHomeViewController;

@end

