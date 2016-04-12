//
//  DFPayMoney.h
//  ScreamingCloud
//
//  Created by zhangfuyu on 16/3/1.
//  Copyright © 2016年 zhangfuyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DFPayMoney : NSObject

/*
 支付宝支付
*/

+ (void)payMoneyForAlipay:(id)model;

/*
 微信支付
 */
+ (void)payMoneyForWeiXin:(id)model;



@end
