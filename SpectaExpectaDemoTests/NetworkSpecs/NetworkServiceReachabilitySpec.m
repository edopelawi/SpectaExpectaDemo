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

SpecBegin(NetworkServiceReachability)

__block NetworkService *networkService;
__block MockReachabilityService *reachabilityService;
__block NSError *returnedError;
__block BOOL completionBlockCalled;

describe(@"NetworkService's sendRequest:completion:", ^{

	beforeEach(^{ // setUp

		reachabilityService = [MockReachabilityService new];
		networkService = [[NetworkService alloc] initWithReachabilityService: reachabilityService];
		returnedError = nil;
		completionBlockCalled = NO;
	});

	context(@"when there is a network connection available", ^{

		beforeEach(^{

			[reachabilityService reset];
			reachabilityService.isNetworkAvailableResult = YES;

			NSObject *request = [NSObject new];

			[networkService sendRequest:request completion:^(NSError * _Nullable error) {
				returnedError = error;
				completionBlockCalled = YES;
			}];

		});

		it(@"should check the connection using reachabilityService", ^{
			expect(reachabilityService.isNetworkAvailableCalled).to.beTruthy();	
		});

		it(@"will not return error to the completion block", ^{

			BOOL noError = (returnedError == nil);
			expect(noError).to.beTruthy();
		});

		it(@"should call the completion block nonetheless", ^{
			expect(completionBlockCalled).to.beTruthy();
		});

	});

	context(@"when there is no network connection available", ^{


		beforeEach(^{

			[reachabilityService reset];
			reachabilityService.isNetworkAvailableResult = NO;

			NSObject *request = [NSObject new];

			[networkService sendRequest:request completion:^(NSError * _Nullable error) {
				returnedError = error;
				completionBlockCalled = YES;
			}];

		});

		it(@"should check the connection using reachabilityService", ^{

			expect(reachabilityService.isNetworkAvailableCalled).to.beTruthy();
		});

		it(@"should return NSError to the completion block", ^{

			expect(returnedError).toNot.beNil();
			expect(returnedError).to.beAKindOf([NSError class]);
		});

		it(@"should call the completion block nonetheless", ^{
			expect(completionBlockCalled).to.beTruthy();
		});
	});
});

SpecEnd
