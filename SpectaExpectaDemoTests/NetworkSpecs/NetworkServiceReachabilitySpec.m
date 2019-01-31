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

describe(@"NetworkService's sendRequest:completion:", ^{

	__block NSError *returnedError;

	beforeEach(^{
		returnedError = nil;
	});

	context(@"when there is no network connection", ^{

		beforeEach(^{

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

	context(@"when there network connection are available", ^{

		beforeEach(^{

			[reachabilityService reset];
			reachabilityService.isNetworkAvailableResult = YES;

			NetworkRequest *request = [NetworkRequest new];

			[networkService sendRequest:request
							 completion:^(NSError * _Nullable error) {
								 returnedError = error;
							 }];
		});

		it(@"should check network availability in its ReachabilityService", ^{
			expect(reachabilityService.isNetworkAvailableCalled).to.beTruthy();
		});

		it(@"should return nil as error to the completion block", ^{

			// TODO: This checking is necessary since using "beNil()" leads to crash. Sigh.
			BOOL noError = returnedError == nil;
			expect(noError).to.beTruthy();
		});
	});
});

SpecEnd
