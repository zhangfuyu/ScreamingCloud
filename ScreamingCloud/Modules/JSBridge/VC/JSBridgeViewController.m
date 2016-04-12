//
//  JSBridgeViewController.m
//  ScreamingCloud
//
//  Created by zhangfuyu on 16/3/5.
//  Copyright © 2016年 zhangfuyu. All rights reserved.
//

#import "JSBridgeViewController.h"

@interface JSBridgeViewController ()<UIWebViewDelegate>

@end

@implementation JSBridgeViewController
@synthesize thewebView;
@synthesize bridge = _bridge;

static NSInteger caceint = 0;


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    
    if (_bridge) { return; }
    if (caceint !=0) {
        NSURLCache * cache = [NSURLCache sharedURLCache];
        [cache removeAllCachedResponses];
        [cache setDiskCapacity:0];
        [cache setMemoryCapacity:0];
        
    }
    
    self.thewebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height - 0)];
    
    

    [self.view addSubview:self.thewebView];
    
//    [WebViewJavascriptBridge enableLogging];
//    
    _bridge = [WebViewJavascriptBridge bridgeForWebView:self.thewebView];
//    _bridge = [WebViewJavascriptBridge bridgeForWebView:self.thewebView webViewDelegate:self handler:^(id data, WVJBResponseCallback responseCallback) {
//    
//        NSLog(@"Received message from javascript: %@", data);
//
//        responseCallback(@"Response for message from ObjC");
//    }];
    
    NSURL *requestURL = [NSURL URLWithString:/*@"http://www.baidu.com"*/@"http://test.hzjianjiao.com/?open=yes&oid=oAIHcsvswfpaxJpgVZjI_SX-X1_4"];
    NSURLRequest *request =[NSURLRequest requestWithURL:requestURL];
    self.conect =[[NSURLConnection alloc] initWithRequest:request delegate:self];
    self.thewebView.delegate =self;
    [self.thewebView loadRequest:request];//NSAppTransportSecurity App Transport Security Settings
    
    [self dobyBridge];


}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES]; //withAnimation:UIStatusBarAnimationFade];
//    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
//        
//        [self prefersStatusBarHidden];
//        
//        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
//        
//    }
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
//    [SVProgressHUD dismiss];
//    [SVProgressHUD showErrorWithStatus:@"网络异常，请重试"];
    
//    [self.thewebView.scrollView headerEndRefreshing];
}
///////////////
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    [webView stringByEvaluatingJavaScriptFromString:@"var e=document.createEvent('Event'); e.initEvent('unload', true, true); window.dispatchEvent(e);"];
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
//    stime = CFAbsoluteTimeGetCurrent();
//    [SVProgressHUD showWithStatus:@"加载中···"];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
//    TitleLB.text = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
//    [TitleLB sizeToFit];
//    
//    self.navigationItem.titleView = TitleLB;
    
    [webView stringByEvaluatingJavaScriptFromString:@"if(window.qingkeApi!=undefined){try{window.qingkeApi.readyed();}catch(e){console.log(e);}}"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitUserSelect='none';"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitTouchCallout='none';"];
    
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"WebKitCacheModelPreferenceKey"];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"WebKitDiskImageCacheEnabled"];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"WebKitOfflineWebApplicationCacheEnabled"];
    [[NSUserDefaults standardUserDefaults] synchronize];
//    [SVProgressHUD dismiss];
    
//    [webView stringByEvaluatingJavaScriptFromString:[EJURLCache injectJavaScriptConfig:webView.request]];
    
//    [self.thewebView.scrollView headerEndRefreshing];
    
//    CGFloat loadtime = CFAbsoluteTimeGetCurrent() - stime;
    
//    NSLog(@"loadtime: %lf", loadtime);
}


- (void)dobyBridge{

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
