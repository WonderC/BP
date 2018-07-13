//
//  SCLoginViewController.m
//  BaseProject
//
//  Created by wonderC on 2017/2/10.
//  Copyright © 2017年 wonderC. All rights reserved.
//

#import "SCLoginViewController.h"
#import "SCBaseViewController_SCPrivateMethod.h"

@interface SCLoginViewController ()

@end

@implementation SCLoginViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = kPurpleColor;
    self.scNavigationController.navBarColor = kLightGrayColor;
    
    [self SCBaseVCPrivateMethod];
    
    if (self.receiveParameter) {SCLog(@"%@",self.receiveParameter);}
    
    [self navigationLeftBarClickMethod];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //改变Tabbar背景颜色以及上面线的颜色
    [((AppDelegate *)SCAppDelegate).tabbarController setTabBarShadowColor:kLightGrayColor];
    [((AppDelegate *)SCAppDelegate).tabbarController setTabBarShadowImageColor:kLightGrayColor];
}

- (void)navigationLeftBarClickMethod{
    
    SCLog(@"navigationLeftBarClickMethod");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
