//
//  WXUserInfor.h
//  ScreamingCloud
//
//  Created by zhangfuyu on 16/3/16.
//  Copyright © 2016年 zhangfuyu. All rights reserved.
//

//#import <Foundation/Foundation.h>

#import "JSONModel.h"

@interface WXUserInfor : JSONModel

@property (nonatomic , copy)NSString *city;

@property (nonatomic , copy)NSString *country;

@property (nonatomic , copy)NSString *headimgurl;

@property (nonatomic , copy)NSString *language;

@property (nonatomic , copy)NSString *nickname;

@property (nonatomic , copy)NSString *openid;

@property (nonatomic , copy)NSString *province;

@property (nonatomic , copy)NSString *sex;

@property (nonatomic , copy)NSString *unionid;

@end
