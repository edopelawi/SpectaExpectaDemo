//
//  MockReachabilityService.m
//  SpectaExpectaDemoTests
//
//  Created by Ricardo Pramana Suranta on 31/01/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

#import "MockReachabilityService.h"

@interface MockReachabilityService ()

@property (nonatomic) BOOL isNetworkAvailableCalled;

@end

@implementation MockReachabilityService

- (instancetype)init
{
	self = [super init];

	if (self) {
		self.isNetworkAvailableResult = NO;
		self.isNetworkAvailableCalled = NO;
	}

	return self;
}

- (BOOL)isNetworkAvailable {

	self.isNetworkAvailableCalled = YES;
	return self.isNetworkAvailableResult;
}

- (void)reset {
	self.isNetworkAvailableResult = NO;
	self.isNetworkAvailableCalled = NO;
}



@end
