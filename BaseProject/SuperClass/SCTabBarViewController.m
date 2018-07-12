//
//  SCTabBarViewController.m
//  BaseProject
//
//  Created by wonderC on 2017/2/9.
//  Copyright © 2017年 wonderC. All rights reserved.
//

#import "SCTabBarViewController.h"

@interface SCTabBarViewController ()
@property (nonatomic,strong) UIView *tabbarBackView;
@end

@implementation SCTabBarViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setupTabarNavigationControllers];
}

/**
 设置TaBar控制器
 */
- (void)setupTabarNavigationControllers{
    
    self.viewControllers = @[
                             [SCMainNavigationViewController navigationWithViewController:@"ViewController"  selectedImageName:@"s_home_on" unselectImageName:@"s_home_on" tabbarAndNavigationTitle:@"我"],
                             [SCMainNavigationViewController navigationWithViewController:@"SCHomeViewController"  selectedImageName:@"s_home_on" unselectImageName:@"s_home_on" tabbarAndNavigationTitle:@"首页"],
                             [SCMainNavigationViewController navigationWithViewController:@"SCLoginViewController"  selectedImageName:@"s_home_on" unselectImageName:@"s_home_on" tabbarAndNavigationTitle:@"登录"]];
    //默认选择
    self.selectedIndex = 0;
}


- (void)setTabBarShadowColor:(nullable UIColor *)color{
    
    if (!_tabbarBackView) {[self.tabBar insertSubview:self.tabbarBackView atIndex:0];}
    self.tabbarBackView.backgroundColor = color;;
    self.tabBar.opaque = YES;
}

- (void)setTabBarShadowImageColor:(nullable UIColor *)color{
    
    [self.tabBar setShadowImage:[YYImage imageWithColor:color]];
    [self.tabBar setBackgroundImage:[[UIImage alloc] init]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TabBar背景视图

- (UIView *)tabbarBackView{
    
    if (!_tabbarBackView) {_tabbarBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 49)];}
    return _tabbarBackView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
