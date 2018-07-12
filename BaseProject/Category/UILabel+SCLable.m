//
//  UILabel+SCLable.m
//  BaseProject
//
//  Created by wonderC on 2017/2/21.
//  Copyright © 2017年 wonderC. All rights reserved.
//

#import "UILabel+SCLable.h"

@implementation UILabel (SCLable)

+ (instancetype)labelWithFrame:(CGRect)frame text:(NSString *)text{
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;    
    label.textAlignment = NSTextAlignmentCenter;
    [label sizeToFit];
    return label;
}

+ (instancetype)labelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)color{
    
    UILabel *label = [self labelWithFrame:frame text:text];
    label.textColor = color;
    return label;
}

+ (instancetype)labelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)color font:(CGFloat)font{
    
    UILabel *label = [self labelWithFrame:frame text:text textColor:color];
    label.font = [UIFont systemFontOfSize:font];
    return label;
}

+ (instancetype)labelWithFrame:(CGRect)frame attributeText:(NSAttributedString *)text{
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textAlignment = NSTextAlignmentCenter;
    label.attributedText = text;
    return label;
}

+ (instancetype)labelWithFrame:(CGRect)frame attributeText:(NSString *)text attributeDictionary:(NSDictionary *)dic{
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textAlignment = NSTextAlignmentCenter;
    NSDictionary *fontAttributeDic = dic;
    NSMutableAttributedString *mutableAttributedStr = [[NSMutableAttributedString alloc]initWithString:text attributes:fontAttributeDic];
    label.attributedText = mutableAttributedStr;
    return label;
}

@end
