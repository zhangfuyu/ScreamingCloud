//
//  WXLogin.m
//  ScreamingCloud
//
//  Created by zhangfuyu on 16/3/16.
//  Copyright © 2016年 zhangfuyu. All rights reserved.
//

#import "WXLogin.h"

@implementation WXLogin

+ (void)weiXinLoginIn
{
    [self sendAuthRequest];
}

+ (void)sendAuthRequest
{
    SendAuthReq* req =[[SendAuthReq alloc ] init];
    req.scope = @"snsapi_userinfo";
    req.state = @"weixin" ;
    [WXApi sendReq:req];
}



@end
