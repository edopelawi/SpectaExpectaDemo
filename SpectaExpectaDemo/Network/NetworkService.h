//
//  NetworkService.h
//  SpectaExpectaDemo
//
//  Created by Ricardo Pramana Suranta on 31/01/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReachabilityService.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkService : NSObject

- (instancetype)initWithReachabilityService:(id<ReachabilityService>)reachabilityService;

- (void)sendRequest:(NSObject *)request completion:(void(^_Nullable)(NSError * _Nullable))completion;

@end

NS_ASSUME_NONNULL_END
