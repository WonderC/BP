//
//  UIButton+SCButton.h
//  BaseProject
//
//  Created by wonderC on 2017/2/9.
//  Copyright © 2017年 wonderC. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 默认居中对齐
 */
@interface UIButton (SCButton)

/**
 frame title
 
 @param frame frame
 @param title title
 @return 返回按钮
 */
+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString *)title;

/**
 frame title color
 
 @param frame frame
 @param title title
 @param color title color
 @return 返回按钮
 */
+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)color target:(id)target action:(SEL)action;

/**
 frame title color bgcolor
 
 @param frame frame
 @param title title
 @param color title color
 @param bgcolor background color
 @return 返回按钮
 */
+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)color bgColor:(UIColor *)bgcolor target:(id)target action:(SEL)action;

/**
 frame title font color bgcolor
 
 @param frame frmae
 @param title title
 @param font font
 @param color title color
 @param bgcolor background color
 @return 返回按钮
 */
+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString *)title font:(NSInteger)font titleColor:(UIColor *)color bgColor:(UIColor *)bgcolor target:(id)target action:(SEL)action;

/**
 frame attributeTitle
 
 @param frame frame
 @param title 属性字符串
 @return 返回按钮
 */
+ (instancetype)buttonWithFrame:(CGRect)frame attributeTitle:(NSAttributedString *)title;

/**
 frame title target action

 @param frame frame
 @param title 属性字符串
 @param target target
 @param action action
 @return 返回按钮
 */
+ (instancetype)buttonWithFrame:(CGRect)frame attributeTitle:(NSAttributedString *)title target:(id)target action:(SEL)action;


/**
 初始化图片按钮
 
 @param frame frame
 @param hlightImageName norImageName
 @param imageName higImageName
 @return 返回图片按钮
 */
+ (instancetype)buttonWithFrame:(CGRect)frame image:(NSString *)imageName hlightImage:(NSString *)hlightImageName;

/**
 初始化图片按钮
 
 @param frame frame
 @param hlightImageName background image name
 @param imageName high image name
 @param target target
 @param action action method
 @return 返回图片按钮
 */
+ (instancetype)buttonWithFrame:(CGRect)frame image:(NSString *)imageName hlightImage:(NSString *)hlightImageName target:(id)target action:(SEL)action;

@end
