//
//  SCMainNavigationViewController.h
//  BaseProject
//
//  Created by wonderC on 2017/2/9.
//  Copyright © 2017年 wonderC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCMainNavigationViewController : UINavigationController

@property (nonatomic,strong,nullable) UIColor *navBarColor;

/**
 设置导航控制器
 
 @param VCName 控制器名称
 @param selecteName 选中时图片名称
 @param unselecteName 未选中时图片名称
 @param title Tabbar和导航的名称
 @return 返回导航控制器
 */
+ (nullable instancetype)navigationWithViewController:(nullable NSString *)VCName
                                    selectedImageName:(nullable NSString *)selecteName
                                    unselectImageName:(nullable NSString *)unselecteName
                             tabbarAndNavigationTitle:(nullable NSString *)title;


/**
 导航控制器 push 控制器

 @param VCName 控制器名称
 */
- (void)pushViewController:(nullable NSString *)VCName;

/**
 导航控制器 push 控制器 带参数

 @param VCName 控制器名称
 @param parameter 需要传的参数
 */
- (void)pushViewController:(nullable NSString *)VCName parameter:(nullable id)parameter;

@end
