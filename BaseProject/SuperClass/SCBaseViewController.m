//
//  SCBaseViewController.m
//  BaseProject
//
//  Created by wonderC on 2017/2/9.
//  Copyright © 2017年 wonderC. All rights reserved.
//

#import "SCBaseViewController.h"
#import "SCBaseViewController_SCPrivateMethod.h"

@interface SCBaseViewController ()

@end

@implementation SCBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationLeftButtonImageName:@""];
}

- (void)SCBaseVCPrivateMethod{
    SCLog(@"SCBaseViewController.h");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 设置导航左右按钮

- (void)setNavigationLeftButtonImageName:(NSString *)leftImageName{
    
    if (!leftImageName || [leftImageName isEqualToString:@""]) {self.navigationItem.leftBarButtonItem = nil; return;}

    UIButton *leftButton = [UIButton buttonWithFrame:CGRectMake(0, 0, kNavigationHeight, kNavigationHeight) image:leftImageName hlightImage:leftImageName target:self action:@selector(navigationLeftBarClickMethod)];
    UIBarButtonItem * barBtn = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = barBtn;
}

- (void)setNavigationLeftButtonLeftText:(NSString *)leftText{
    
    if (!leftText || [leftText isEqualToString:@""]) {self.navigationItem.leftBarButtonItem = nil; return;}
    
    UIButton *leftButton = [UIButton buttonWithFrame:CGRectMake(0, 0, kNavigationHeight, kNavigationHeight)  title:leftText titleColor:kBlueColor target:self action:@selector(navigationLeftBarClickMethod)];
    UIBarButtonItem * barBtn = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = barBtn;
}

- (void)setNavigationRightButtonImageName:(NSString *)rightImageName{
    
    if (!rightImageName || [rightImageName isEqualToString:@""]) {self.navigationItem.rightBarButtonItem = nil; return;}
    
    UIButton *rightButton = [UIButton buttonWithFrame:CGRectMake(0, 0, kNavigationHeight, kNavigationHeight) image:rightImageName hlightImage:rightImageName target:self action:@selector(navigationRightBarClickMethod)];
    UIBarButtonItem * barBtn = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = barBtn;
}

- (void)setNavigationRightButtonRightText:(NSString *)rightText{
    
    if (!rightText || [rightText isEqualToString:@""]) {self.navigationItem.leftBarButtonItem = nil; return;}
    
    UIButton *rightButton = [UIButton buttonWithFrame:CGRectMake(0, 0, kNavigationHeight, kNavigationHeight)  title:rightText titleColor:kBlueColor target:self action:@selector(navigationRightBarClickMethod)];
    UIBarButtonItem * barBtn = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = barBtn;
}

- (void)navigationLeftBarClickMethod{
 
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)navigationRightBarClickMethod{
    
    SCLog(@"navigationRightBarClickMethod");
}

- (SCMainNavigationViewController *)scNavigationController{
    return  (SCMainNavigationViewController *)self.navigationController;
}

@end
