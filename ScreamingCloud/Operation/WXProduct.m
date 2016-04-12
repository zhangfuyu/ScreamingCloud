//
//  WXProduct.m
//  ScreamingCloud
//
//  Created by zhangfuyu on 16/3/2.
//  Copyright © 2016年 zhangfuyu. All rights reserved.
//

#import "WXProduct.h"

@implementation WXProduct

@def_singleton(WXProduct);


- (void)setUserinfor:(WXUserInfor *)userinfor
{
    _userinfor = userinfor;
}

@end
