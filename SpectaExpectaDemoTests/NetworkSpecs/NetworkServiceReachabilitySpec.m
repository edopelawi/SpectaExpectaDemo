//
//  NetworkServiceReachabilitySpec.m
//  SpectaExpectaDemoTests
//
//  Created by Ricardo Pramana Suranta on 31/01/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Specta/Specta.h>
#import <Expecta/Expecta.h>

#import "MockReachabilityService.h"
#import "NetworkService.h"
#import "NetworkRequest.h"

SpecBegin(NetworkServiceReachability)

__block NetworkService *networkService;
__block MockReachabilityService *reachabilityService;

beforeEach(^{
	reachabilityService = [MockReachabilityService new];
	networkService = [[NetworkService alloc] initWithReachabilityService: reachabilityService];
});

describe(@"NetworkService's requestURL", ^{

	context(@"when there is no network connection", ^{

		__block NSError *returnedError;

		beforeEach(^{

			returnedError = nil;

			[reachabilityService reset];
			reachabilityService.isNetworkAvailableResult = NO;

			NetworkRequest *request = [NetworkRequest new];

			[networkService sendRequest:request
							 completion:^(NSError * _Nullable error) {
								 returnedError = error;
							 }];
		});

		it(@"should check network availability in its ReachabilityService", ^{
			expect(reachabilityService.isNetworkAvailableCalled).to.beTruthy();
		});

		it(@"should return error to the completion block", ^{
			expect(returnedError).toNot.beNil();
		});
	});
});

SpecEnd
