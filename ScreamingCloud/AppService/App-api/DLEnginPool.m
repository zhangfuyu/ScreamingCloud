//
//  DLEnginPool.m
//  ServerTeacher
//
//  Created by XueYulun on 15/3/31.
//  Copyright (c) 2015年 X. All rights reserved.
//

#import "DLEnginPool.h"

@interface DLEnginPool ()

@end

static DLEnginPool * pool;

@implementation DLEnginPool

+ (instancetype)shareEngin {
    
    @synchronized(self)
    {
        if (!pool) {
            
            pool = [[DLEnginPool alloc] init];
            [pool initilizedEngin];
        }
        return pool;
    }
}

- (void)initilizedEngin {
    
    _postEngin = [[MKNetworkEngine alloc] initWithHostName:DF_SERVER_HOST];
    _getEngin  = [[MKNetworkEngine alloc] initWithHostName:DF_SERVER_HOST];
    
//    [_postEngin useCache], [_getEngin useCache];
    
    _enginPool = [NSMutableArray arrayWithObjects:_postEngin, _getEngin, nil];
}

- (MKNetworkEngine *)getEngin {
    
    if (!_getEngin) {
        
        _getEngin = [[MKNetworkEngine alloc] initWithHostName:DF_SERVER_HOST];
//        [_getEngin useCache];
        [_enginPool addObject:_getEngin];
    }
    
    return _getEngin;
}

- (MKNetworkEngine *)postEngin {
    
    if (!_postEngin) {
        
        _postEngin = [[MKNetworkEngine alloc] initWithHostName:DF_SERVER_HOST];
//        [_postEngin useCache];
        [_enginPool addObject:_postEngin];
    }
    
    return _postEngin;
}

- (void)emptyCacheEnginWith: (NSString *)host {
    
    for (MKNetworkEngine * engin in _enginPool) {
        
        if ([engin.readonlyHostName isEqualToString:host]) {
            
            [engin emptyCache];
        }
    }
}

+ (MKNetworkEngine *)newEngin: (NSString *)hostName {
    
    MKNetworkEngine * newEngin = [[MKNetworkEngine alloc] initWithHostName:hostName];
    [[DLEnginPool shareEngin].enginPool addObject:newEngin];
    return newEngin;
}

- (void)emptyAllCache {

    [_enginPool makeObjectsPerformSelector:@selector(emptyCache)];
}

- (void)cancelAllRequest {
    
    [_enginPool makeObjectsPerformSelector:@selector(cancelAllOperation)];
}

- (int)cacheMemoryCost {
    
    __block int cost = 0;
    
    [_enginPool enumerateObjectsUsingBlock:^(MKNetworkEngine * engin, NSUInteger idx, BOOL *stop) {
        
        cost += [engin cacheMemoryCost];
    }];
    
    return cost;
}

@end
