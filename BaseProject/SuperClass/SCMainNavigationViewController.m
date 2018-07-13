//
//  SCMainNavigationViewController.m
//  BaseProject
//
//  Created by wonderC on 2017/2/9.
//  Copyright © 2017年 wonderC. All rights reserved.
//

#import "SCMainNavigationViewController.h"
#import "SCBaseViewController.h"

@interface SCMainNavigationViewController ()

@property (nonatomic,weak)Class pushViewCtroller; //记录最后一个控制器防止多次push

@end

@implementation SCMainNavigationViewController

#pragma mark - life cycle

- (void)viewDidLoad {
 
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - rewrite pop push method

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.pushViewCtroller != [viewController class]) {
        self.pushViewCtroller = [viewController class];
        [super pushViewController:viewController animated:animated];
    }
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated{
    
    self.pushViewCtroller = nil;
    return [super popViewControllerAnimated:animated];
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated{
    
    self.pushViewCtroller = nil;
    return [super popToRootViewControllerAnimated:animated];
}

- (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    self.pushViewCtroller = nil;
    return [super popToViewController:viewController animated:animated];
}

#pragma mark - public method 

+ (nullable instancetype)navigationWithViewController:(nullable NSString *)VCName
                           selectedImageName:(nullable NSString *)selecteName
                           unselectImageName:(nullable NSString *)unselecteName
                    tabbarAndNavigationTitle:(nullable NSString *)title
{
    
    SCBaseViewController *controller = (SCBaseViewController *)[[NSClassFromString(VCName) alloc] init];
    //设置选择图片
    UITabBarItem *tabbarItem = [[UITabBarItem alloc] initWithTitle:title
                                     image:[[UIImage imageNamed:unselecteName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                             selectedImage:[[UIImage imageNamed:selecteName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    tabbarItem.titlePositionAdjustment = UIOffsetMake(0, -3.0);
    controller.tabBarItem = tabbarItem;
    
    //设置Tabbar title文字颜色 
    [tabbarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:kBlueColor} forState:UIControlStateNormal];
    [tabbarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:kOrangeColor} forState:UIControlStateSelected];
    
    controller.title = title;
    
    return [[self alloc] initWithRootViewController:controller];
}


- (void)pushViewController:(nullable NSString *)VCName{
    
    if (!VCName || [VCName isEqualToString:@""]) return;
    
    Class class = NSClassFromString(VCName);
    if (!class || ![class isSubclassOfClass:[SCBaseViewController class]]) return;
    
    SCBaseViewController *viewController = (SCBaseViewController *)[[class alloc] init];
    [self pushViewController:viewController animated:YES];
}

- (void)pushViewController:(nullable NSString *)VCName parameter:(nullable id)parameter{
    
    if (!VCName || [VCName isEqualToString:@""]) return;
    if (!parameter) [self pushViewController:VCName];
    
    Class class = NSClassFromString(VCName);
    if (!class || ![class isSubclassOfClass:[SCBaseViewController class]]) return;
    
    SCBaseViewController *viewController = (SCBaseViewController *)[[NSClassFromString(VCName) alloc] init];
    viewController.receiveParameter = parameter;
    [self pushViewController:viewController animated:YES];
}

- (void)setNavBarColor:(UIColor *)navBarColor{

    if (!navBarColor ) {return;}
    
    self.navigationBar.barTintColor = navBarColor;
}

@end
