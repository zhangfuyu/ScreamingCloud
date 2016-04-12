//
//  JSBridgeViewController.h
//  ScreamingCloud
//
//  Created by zhangfuyu on 16/3/5.
//  Copyright © 2016年 zhangfuyu. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface JSBridgeViewController : UIViewController

@property (retain,nonatomic) UIWebView *thewebView;
@property (strong, nonatomic) WebViewJavascriptBridge *bridge;
@property (retain,nonatomic) NSURLConnection *conect;



@end
