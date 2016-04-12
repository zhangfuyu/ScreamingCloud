//
//  BaseViewController.m
//  ScreamingCloud
//
//  Created by zhangfuyu on 16/2/23.
//  Copyright © 2016年 zhangfuyu. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UINavigationItem *)NavItem {
    
    return self.navigationItem;
}

- (UINavigationBar *)NavBar {
    
    return self.navigationController.navigationBar;
}


- (void)setStatusBarHid:(BOOL)hidden
{
    
    [[UIApplication sharedApplication] setStatusBarHidden:hidden];
    
}
- (void)setNavBarHid: (BOOL)hidden {
    
    self.NavBar.hidden = hidden;
}
- (void)setNavBarBackGroundColor:(UIColor *)color
{
    self.NavBar.tintColor = color;
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
