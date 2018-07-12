//
//  UILabel+SCLable.h
//  BaseProject
//
//  Created by wonderC on 2017/2/21.
//  Copyright © 2017年 wonderC. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 只有颜色的Label

 @param frame frame
 @param color color
 @return color label
 */
UIKIT_STATIC_INLINE UILabel *lineLabelWithRect(CGRect frame,UIColor *color){
    
    UILabel *lineLale = [[UILabel alloc] initWithFrame:frame];
    
    if (!color) {lineLale.backgroundColor = [UIColor lightGrayColor];}
    else{lineLale.backgroundColor = color;}
    
    return lineLale;
};

/**
 默认居中对齐
 */
@interface UILabel (SCLable)

/**
 初始化Label
 
 @param frame frame
 @param text text
 @return Label
 */
+ (instancetype)labelWithFrame:(CGRect)frame text:(NSString *)text;

/**
 初始化Label
 
 @param frame frame
 @param text text
 @param color textColor
 @return Label
 */
+ (instancetype)labelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)color;

/**
 初始化Label
 
 @param frame frame
 @param text text
 @param font font
 @param color textColor
 @return Label
 */
+ (instancetype)labelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)color font:(CGFloat)font;

/**
 初始化Label

 @param frame frame
 @param text 属性字符串
 @return 返回带属性字符串的Label
 */
+ (instancetype)labelWithFrame:(CGRect)frame attributeText:(NSAttributedString *)text;

/**
 初始化Label
 
 @param frame frame
 @param text text
 @param dic 属性字典
 @return 返回带属性字符串的Label
 */
+ (instancetype)labelWithFrame:(CGRect)frame attributeText:(NSString *)text attributeDictionary:(NSDictionary *)dic;

@end
