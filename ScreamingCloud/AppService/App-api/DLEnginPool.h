//
//  DLEnginPool.h
//  ServerTeacher
//
//  Created by XueYulun on 15/3/31.
//  Copyright (c) 2015年 X. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MKNetworkEngine;
//! @abstract Main Engin pool, Private Server Engin pool.
@interface DLEnginPool : NSObject

+ (instancetype)shareEngin;

//! @abstract POST
@property (nonatomic, strong) MKNetworkEngine * postEngin;

//! @abstract GET
@property (nonatomic, strong) MKNetworkEngine * getEngin;

//! @abstract engin pool
@property (nonatomic, strong) NSMutableArray * enginPool;

/**
 *  Get new Engin without host name
 */
+ (MKNetworkEngine *)newEngin: (NSString *)hostName;

/// 移除该Host下所有引擎缓存
- (void)emptyCacheEnginWith: (NSString *)host;

/// 清空缓存
- (void)emptyAllCache;

/// 清除当前所有的请求
- (void)cancelAllRequest;

/// 缓存消耗的数量
- (int)cacheMemoryCost;

@end