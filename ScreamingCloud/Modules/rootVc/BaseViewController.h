//
//  BaseViewController.h
//  ScreamingCloud
//
//  Created by zhangfuyu on 16/2/23.
//  Copyright © 2016年 zhangfuyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (UINavigationItem *)NavItem;
- (UINavigationBar *)NavBar;
//! @name 设置隐藏NavigationBar
- (void)setNavBarHid: (BOOL)hidden;

//! @name 设置隐藏statubar
- (void)setStatusBarHid:(BOOL)hidden;


//! @name 设置NavigationBar颜色
- (void)setNavBarBackGroundColor:(UIColor *)color;


@end
