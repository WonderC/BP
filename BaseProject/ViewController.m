//
//  ViewController.m
//  BaseProject
//
//  Created by wonderC on 2017/2/7.
//  Copyright © 2017年 wonderC. All rights reserved.
//

#import "ViewController.h"
#import "SCBaseViewController_SCPrivateMethod.h"

@interface ViewController ()

@property (nonatomic,strong) NSMutableArray *dataArr;

@end

@implementation ViewController

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = kLightGrayColor;
    
    //打印方法
    SCLog(@"viewcontroller");
    
    //打印常量
    SCLog(@"%@",SCNotificationName);
    
    //UUID
    SCLog(@"stringWithUUID_%@",[NSString stringWithUUID]);
 
    [self SCBaseVCPrivateMethod];
}

- (void)SCBaseVCPrivateMethod{
    
    SCLog(@"ViewController.m");
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //改变Tabbar背景颜色以及上面线的颜色
    [((AppDelegate *)SCAppDelegate).tabbarController setTabBarShadowColor:kLightGrayColor];
    [((AppDelegate *)SCAppDelegate).tabbarController setTabBarShadowImageColor:kOrangeColor];
}

- (void)dealloc {

}

#pragma mark - Custom Accessors

- (void)setCustomProperty:(id)value {}

#pragma mark - Actions

- (void)submitData:(id)sender {}

#pragma mark - Public

- (void)publicMethod {}

#pragma mark - Private

- (void)privateMethod {}

#pragma mark - Protocol conformance

#pragma mark - UITextFieldDelegate

#pragma mark - UITableViewDataSource

#pragma mark - UITableViewDelegate

#pragma mark - NSCopying

#pragma mark - NSObject

#pragma mark -  Lazy

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

@end
