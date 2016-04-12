//
//  DFServer.m
//  ScreamingCloud
//
//  Created by zhangfuyu on 16/2/24.
//  Copyright © 2016年 zhangfuyu. All rights reserved.
//

#import "DFServer.h"

@implementation DFServer


#pragma mark - POST

+ (void)POST: (NSString *)path param: (NSMutableDictionary *)paramDict complete: (ServerCompletionHandleBlock)complete error: (ErrorHandle)errorBlock {
    [self POST:path param:paramDict complete:complete error:errorBlock timeout:kMKNetworkKitRequestTimeOutInSeconds];
}

+ (void)POST: (NSString *)path param: (NSMutableDictionary *)paramDict complete: (ServerCompletionHandleBlock)complete error: (ErrorHandle)errorBlock timeout: (int)timeout {
    
    NSString * API = path;
//    if ([self accessToken]) {
//        
//        API = [self api:API];
//    }
    
    //    NSString * API = [self addGetDefaultRequstParam:path];
    if(API)
    {
        MKNetworkOperation * operation = [self ConfigOperation:API param:paramDict method:DL_POST timeout:timeout ssl:NO complete:complete error:errorBlock];
        
        [[DLEnginPool shareEngin].postEngin enqueueOperation:operation];
    }
}



#pragma mark - Global

+ (MKNetworkOperation *)ConfigOperation: (NSString *)path param: (NSMutableDictionary *)paramDict method: (NSString *)method timeout: (int)timeout ssl: (BOOL)ssl complete: (ServerCompletionHandleBlock)complete error: (ErrorHandle)errorBlock {
    
    MKNetworkEngine * engin = [method isEqualToString:DL_GET] ? [DLEnginPool shareEngin].getEngin : [DLEnginPool shareEngin].postEngin;
    
    MKNetworkOperation * operation = [engin operationWithPath:path params:paramDict httpMethod:method ssl:ssl];
//    operation.timeout = timeout;
    
    if ([method isEqualToString:DL_GET]) {
        
        DLog(@"%@:%@",[method uppercaseString],operation.url);
        DLog(@"%@: %@", [method uppercaseString], operation.url);
    } else {
        
        if ([operation.readonlyRequest.URL.path isEqualToString:@"/logs.api"]) {
            
            DLog(@"send exception report.");
        } else {
            
            DLog(@"%@: %@ \nPARAM: %@", [method uppercaseString], operation.url, paramDict);
        }
    }
    
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        NSDictionary * responseDict = [completedOperation responseJSON];
        
        if ([responseDict[@"error"] integerValue] == 0 && [responseDict isKindOfClass:[NSDictionary class]]) {
//            [DLOperation sharedInstance].connetTimer = 0;
            
            complete(YES, [completedOperation responseJSON]);
        } else {
            
//            [self buildRequestAndPostErrorPath:completedOperation.readonlyRequest.URL.path param:[completedOperation.readonlyPostDictionary mutableCopy] type:completedOperation.HTTPMethod errorCode:[responseDict[@"error"] integerValue] errorMsg:responseDict[@"message"] isJS:completedOperation.isJSReq];
//            complete(NO, responseDict);
        }
        
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        
        //        [SVProgressHUD showErrorWithStatus:[error localizedDescription]];
        
        errorBlock(error);
    }];
    
    return operation;
}



#pragma mark - GET

+ (void)GET:  (NSString *)path param: (NSMutableDictionary *)paramDict complete: (ServerCompletionHandleBlock)complete error: (ErrorHandle)errorBlock {
    
    [self GET:path param:paramDict complete:complete error:errorBlock timeout:20];
}


+ (void)GET:  (NSString *)path param: (NSMutableDictionary *)paramDict complete: (ServerCompletionHandleBlock)complete error: (ErrorHandle)errorBlock timeout: (int)timeout {
    
//    [paramDict setValuesForKeysWithDictionary:[self publicHeaders]];
    MKNetworkOperation * operation = [self ConfigOperation:path param:paramDict method:@"GET" timeout:timeout ssl:NO complete:complete error:errorBlock];
    
//    if ( [paramDict.allKeys containsObject:@"Request-Type"] ) {
//        
//        if ( [paramDict[@"Request-Type"] isEqualToString:@"JSAPI"] ) {
//            
//            operation.isJSReq = YES;
//        }
//    }
    
    [[DLEnginPool shareEngin].getEngin enqueueOperation:operation];
}




+ (void)emptyAllCache {
    
    [[DLEnginPool shareEngin] emptyAllCache];
}

+ (void)cancelAllRequest {
    
    [[DLEnginPool shareEngin] cancelAllRequest];
}

+ (int)cacheMemoryCost {
    
    return [[DLEnginPool shareEngin] cacheMemoryCost];
}


@end
