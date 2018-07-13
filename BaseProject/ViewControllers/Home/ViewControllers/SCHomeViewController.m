//
//  SCHomeViewController.m
//  BaseProject
//
//  Created by wonderC on 2017/2/10.
//  Copyright © 2017年 wonderC. All rights reserved.
//

#import "SCHomeViewController.h"
#import "SCHomeModel.h"
#import "SCBaseViewController_SCPrivateMethod.h"

@interface SCHomeViewController ()

@end

@implementation SCHomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = kOrangeColor;
    
    //model的赋值方式
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
    
    SCHomeModel *model = [SCHomeModel modelWithDictionary:@{@"name":@"cc",@"sex":@1,@"pages":@1}];
    SCLog(@"model_%@__%ld___%ld",model.name,(SCSex)model.sex,model.pages);
    
#pragma clang diagnostic pop
    
    //push controller
    [self.scNavigationController pushViewController:@"SCLoginViewController" parameter:@{@"name":@"SC"}];
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.scNavigationController.navBarColor = kPurpleColor;
    
    [((AppDelegate *)SCAppDelegate).tabbarController setTabBarShadowColor:kPurpleColor];
    [((AppDelegate *)SCAppDelegate).tabbarController setTabBarShadowImageColor:kOrangeColor];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
