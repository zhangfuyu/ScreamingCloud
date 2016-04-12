//
//  WXProduct.h
//  ScreamingCloud
//
//  Created by zhangfuyu on 16/3/2.
//  Copyright © 2016年 zhangfuyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXUserInfor.h"

@interface WXProduct : NSObject


@singleton(WXProduct);


@property (nonatomic , copy)NSString *weCode;
@property (nonatomic , copy)NSString *weOpenid;
@property (nonatomic , copy)NSString *weToken;

@property (nonatomic , strong)WXUserInfor *userinfor;


@end
