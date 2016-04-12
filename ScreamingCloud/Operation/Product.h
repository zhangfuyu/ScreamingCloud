//
//  Product.h
//  ScreamingCloud
//
//  Created by zhangfuyu on 16/3/1.
//  Copyright © 2016年 zhangfuyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (nonatomic, assign) float price; //价格
@property (nonatomic, copy) NSString *subject;//商品标题
@property (nonatomic, copy) NSString *body; //商品描述
@property (nonatomic, copy) NSString *orderId; //订单ID（由商家自行制定）


@end
