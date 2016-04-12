//
//  Header.h
//  ScreamingCloud
//
//  Created by zhangfuyu on 16/2/23.
//  Copyright © 2016年 zhangfuyu. All rights reserved.
//

#ifndef Header_h
#define Header_h


#define DFDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)


#import "UIImageView+WebCache.h"

#import "MKNetworkOperation.h"

#import "MKNetworkKit.h"

#import "App-api/DLEnginPool.h"

#import "App-Config/App_Config.h"

#import "DLFrame_Singleton.h"

#import "WXProduct.h"

#import "DFServer.h"
/*
 
 支付宝支付需要类
 
 */

#import "DFPayMoney.h"

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

#import "Order.h"

#import "DataSigner.h"

#import <AlipaySDK/AlipaySDK.h>


/*
 
 微信登录需要类
 
 */

#import "App-Third/WeChatSDK/WXApi.h"



#endif /* Header_h */
