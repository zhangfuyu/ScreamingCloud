//
//  WelcomescreenViewController.h
//  xiaochaidajiang
//
//  Created by zhangfuyu on 15/5/4.
//  Copyright (c) 2015年 zhangfuyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WelcomescreenViewController : UIViewController<UIScrollViewDelegate>
@property(nonatomic, strong)UIScrollView  *scrollView;      //声明一个UIScrollView
@property(nonatomic, strong)UIPageControl *pageControl;     //声明一个UIPageControl
@property(nonatomic, strong)NSArray  *arrayImages;          //存放图片的数组

@end
