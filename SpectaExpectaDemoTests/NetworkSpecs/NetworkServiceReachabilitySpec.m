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

beforeEach(^{
	reachabilityService = [MockReachabilityService new];
	networkService = [[NetworkService alloc] initWithReachabilityService: reachabilityService];
});

SpecEnd
