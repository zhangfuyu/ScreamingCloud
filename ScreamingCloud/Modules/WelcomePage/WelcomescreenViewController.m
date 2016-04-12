//
//  WelcomescreenViewController.m
//  xiaochaidajiang
//
//  Created by zhangfuyu on 15/5/4.
//  Copyright (c) 2015年 zhangfuyu. All rights reserved.
//

#import "WelcomescreenViewController.h"
#import "AppDelegate.h"

@interface WelcomescreenViewController ()

@end

@implementation WelcomescreenViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor whiteColor];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height)];
    [_scrollView setPagingEnabled:YES];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    [_scrollView setDelegate:self];
    [_scrollView setBackgroundColor:[UIColor clearColor]];
    //ContentSize 这个属性对于UIScrollView挺关键的，取决于是否滚动。
    [_scrollView setContentSize:CGSizeMake(CGRectGetWidth(self.view.frame) * 4/*[self.arrayImages count]*/, self.view.bounds.size.height)];
    [self.view addSubview:_scrollView];
    
    
    
    float x=0;
    for (int i=0; i<4; i++)
    {
        UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(i * self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        NSString *imagename=[NSString stringWithFormat:@"welecome%d.png",i+1];
        imageview.backgroundColor =  i % 2 ? [UIColor orangeColor] : [UIColor blackColor];
        imageview.image=[UIImage imageNamed:imagename];
        [_scrollView addSubview:imageview];
        x+=self.view.bounds.size.width;
        
        
    }
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    btn.titleLabel.textColor = [UIColor redColor];
    btn.frame = CGRectMake(self.view.bounds.size.width * 3  , self.view.bounds.size.height - 60, self.view.bounds.size.width , 60);
    [btn addTarget:self action:@selector(clickbtn) forControlEvents:UIControlEventTouchUpInside];
    
    [_scrollView addSubview:btn];

    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.scrollView.frame.size.height - 20, self.view.bounds.size.width, 20)];
    [_pageControl setBackgroundColor:[UIColor clearColor]];
    _pageControl.currentPage = 0;
    _pageControl.numberOfPages = 4;
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    [_pageControl addTarget:self action:@selector(chagePage:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:_pageControl];
    
}

- (void)chagePage:(id)sender
{
     NSInteger page = self.pageControl.currentPage;


     CGRect bounds = self.scrollView.bounds;
     bounds.origin.x = CGRectGetWidth(bounds) * page;
     bounds.origin.y = 0;
     [self.scrollView scrollRectToVisible:bounds animated:YES];
    
    
    
}

-(void)clickbtn
{
    
//    TabBarViewController *tabbar = [[TabBarViewController alloc]init];
//    [self presentViewController:tabbar animated:YES completion:nil];
    
    
//    UIWindow *m_window = [[[UIApplication sharedApplication]delegate]window];
//    m_window.rootViewController = [[TabBarViewController alloc]init];
//    [m_window makeKeyAndVisible];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView==_scrollView)
    {
        int page= _scrollView.contentOffset.x/self.view.frame.size.width;
        _pageControl.currentPage=page;
        
    }
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
