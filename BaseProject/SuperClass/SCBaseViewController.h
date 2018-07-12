//
//  SCBaseViewController.h
//  BaseProject
//
//  Created by wonderC on 2017/2/9.
//  Copyright © 2017年 wonderC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCBaseViewController : UIViewController

/**
 参数
 */
@property (nonatomic,strong) id receiveParameter;

/**
 导航
 */
@property (nonatomic,strong,readonly) SCMainNavigationViewController *scNavigationController;

/**
 设置控制器导航左侧按钮

 @param leftImageName 按钮图片名称
 */
- (void)setNavigationLeftButtonImageName:(NSString *)leftImageName;

/**
 设置控制器导航左侧按钮

 @param leftText 按钮标题
 */
- (void)setNavigationLeftButtonLeftText:(NSString *)leftText;

/**
 设置控制器导航右侧按钮

 @param rightImageName 按钮图片名称
 */
- (void)setNavigationRightButtonImageName:(NSString *)rightImageName;

/**
 设置控制器导航右侧按钮
 
 @param rightText 右侧按钮标题
 */
- (void)setNavigationRightButtonRightText:(NSString *)rightText;

@end
