//
//  ViewController.m
//  ScreamingCloud
//
//  Created by zhangfuyu on 16/2/23.
//  Copyright © 2016年 zhangfuyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor orangeColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(accessCodeSuccess) name:@"ACCESS_CODE_SUCCESS" object:nil];
    
    UIButton *weXinLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    weXinLoginBtn.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - 40, CGRectGetMidY(self.view.bounds) - 40, 80, 80);
    [weXinLoginBtn setTitle:@"微信登录" forState:UIControlStateNormal];
    [weXinLoginBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [weXinLoginBtn addTarget:self action:@selector(weiXinLoginIn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:weXinLoginBtn];
    
    
//    [self jsom];
}

- (void)jsom
{
    NSString *Str2 = @"/SwFile/参展商394/恒安永信营/业/执/照/副/本//////////////////（新）";
    Str2 = [Str2 stringByReplacingOccurrencesOfString:@"/" withString:@""];
    
    NSMutableDictionary *parm = [@{
                                    @"pagesize":@(10),
                                    @"currentPageIndex":@(22),
                                    @"audienceCode":@(-1),
                                    @"keyword":@""
                                   
                                    } mutableCopy];
    
    
    [DFServer GET:@"/mapi/mobile/GetExhibitionList" param:parm complete:^(BOOL requestSuccess, id responseObject) {
//        NSDictionary *dic = responseObject;
        
        
    } error:^(NSError *error) {
        DLog(@"---->%@",[error localizedDescription])
    }];
}

- (void)weiXinLoginIn
{
    [WXLogin weiXinLoginIn];

}

- (void)accessCodeSuccess
{
    [self getAccess_token];
}

-(void)getAccess_token
{
    //https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code
    
    NSString *url =[NSString stringWithFormat:@"https://api.weixin.qq.com/sns/oauth2/access_token?appid=%@&secret=%@&code=%@&grant_type=authorization_code",@"wxe0521d0db854228f",@"c98c024cb63501c61590d75b5429053b",[WXProduct sharedInstance].weCode];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *zoneUrl = [NSURL URLWithString:url];
        NSString *zoneStr = [NSString stringWithContentsOfURL:zoneUrl encoding:NSUTF8StringEncoding error:nil];
        NSData *data = [zoneStr dataUsingEncoding:NSUTF8StringEncoding];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (data) {
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                
                [WXProduct sharedInstance].weToken = [dic objectForKey:@"access_token"] ;
                [WXProduct sharedInstance].weOpenid = [dic objectForKey:@"openid"];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self getUserInfo];
                });
                
                
            }
        });
    });
}

-(void)getUserInfo
{
    // https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID
    
    NSString *url =[NSString stringWithFormat:@"https://api.weixin.qq.com/sns/userinfo?access_token=%@&openid=%@",[WXProduct sharedInstance].weToken,[WXProduct sharedInstance].weOpenid];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *zoneUrl = [NSURL URLWithString:url];
        NSString *zoneStr = [NSString stringWithContentsOfURL:zoneUrl encoding:NSUTF8StringEncoding error:nil];
        NSData *data = [zoneStr dataUsingEncoding:NSUTF8StringEncoding];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (data) {
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                DLog(@"---->%@",dic);
                
                WXUserInfor *infor = [[WXUserInfor alloc]initWithDictionary:dic error:nil];
                
                [WXProduct sharedInstance].userinfor = infor;
                
                DLog(@"----->%@",[WXProduct sharedInstance].userinfor.nickname);
                
            }
        });
        
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"ACCESS_CODE_SUCCESS" object:nil];
}

@end
