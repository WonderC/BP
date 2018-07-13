//
//  UIButton+SCButton.m
//  BaseProject
//
//  Created by wonderC on 2017/2/9.
//  Copyright © 2017年 wonderC. All rights reserved.
//

#import "UIButton+SCButton.h"

@implementation UIButton (SCButton)

+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString *)title{
    
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    return button;
}

+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)color target:(id)target action:(SEL)action{
    
    UIButton *button = [self buttonWithFrame:frame title:title];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)color bgColor:(UIColor *)bgcolor target:(id)target action:(SEL)action{
    
    UIButton *button = [self buttonWithFrame:frame title:title titleColor:color target:self action:action];
    [button setBackgroundColor:bgcolor];
    return button;
}

+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString *)title font:(NSInteger)font titleColor:(UIColor *)color bgColor:(UIColor *)bgcolor target:(id)target action:(SEL)action{
    
    UIButton *button = [self buttonWithFrame:frame title:title titleColor:color bgColor:bgcolor target:self action:action];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    return button;
}

+ (instancetype)buttonWithFrame:(CGRect)frame attributeTitle:(NSAttributedString *)title{
    
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    [button setAttributedTitle:title forState:UIControlStateNormal];
    return button;
}

+ (instancetype)buttonWithFrame:(CGRect)frame attributeTitle:(NSAttributedString *)title target:(id)target action:(SEL)action{
    
    UIButton *button = [self buttonWithFrame:frame attributeTitle:title ];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (instancetype)buttonWithFrame:(CGRect)frame image:(NSString *)imageName hlightImage:(NSString *)hlightImageName{
    
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:hlightImageName] forState:UIControlStateHighlighted];
    return button;
}

+ (instancetype)buttonWithFrame:(CGRect)frame image:(NSString *)imageName hlightImage:(NSString *)hlightImageName target:(id)target action:(SEL)action{
    
    UIButton *button = [self buttonWithFrame:frame image:imageName hlightImage:hlightImageName];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
@end
