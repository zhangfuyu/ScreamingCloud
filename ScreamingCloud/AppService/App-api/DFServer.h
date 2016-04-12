//
//  DFServer.h
//  ScreamingCloud
//
//  Created by zhangfuyu on 16/2/24.
//  Copyright © 2016年 zhangfuyu. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DL_POST @"POST"
#define DL_GET  @"GET"



//! @abstract server request completion block
typedef void (^ServerCompletionHandleBlock)(BOOL requestSuccess, id responseObject);

//! @abstract all error block
typedef void (^ErrorHandle)(NSError * error);

//! @abstract upload progress
typedef void (^uploadProgress)(double progress);



@interface DFServer : NSObject

/**
 *  Normal POST Method
 */
+ (void)POST: (NSString *)path param: (NSMutableDictionary *)paramDict complete: (ServerCompletionHandleBlock)complete error: (ErrorHandle)errorBlock;



/**
 *  Normal GET Method
 */
+ (void)GET:  (NSString *)path param: (NSMutableDictionary *)paramDict complete: (ServerCompletionHandleBlock)complete error: (ErrorHandle)errorBlock /*__deprecated_msg("use GET:param:complete:error:timeout:")*/;




/// 清空缓存
+ (void)emptyAllCache;

/// 取消所有当前请求
+ (void)cancelAllRequest;

/// 内存占用
+ (int)cacheMemoryCost;


@end
