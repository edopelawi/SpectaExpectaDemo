//
//  NetworkService.m
//  SpectaExpectaDemo
//
//  Created by Ricardo Pramana Suranta on 31/01/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

#import "NetworkService.h"
#import "ReachabilityService.h"

@interface NetworkService ()

@property (strong, nonatomic) id<ReachabilityService> reachabilityService;

@end

@implementation NetworkService

- (instancetype)initWithReachabilityService:(id<ReachabilityService>)reachabilityService {

	self = [super init];

	if (self) {
		self.reachabilityService = reachabilityService;
	}

	return self;
}

- (void)sendRequest:(NSObject *)request completion:(void(^_Nullable)(NSError * _Nullable))completion {

	BOOL isNetworkAvailable = [self.reachabilityService isNetworkAvailable];


	if (!isNetworkAvailable) {
		completion([NSError new]);
	} else {
		completion(nil);
	}
}

@end
