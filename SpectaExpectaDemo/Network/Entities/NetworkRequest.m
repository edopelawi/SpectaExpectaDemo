//
//  NetworkRequest.m
//  SpectaExpectaDemo
//
//  Created by Ricardo Pramana Suranta on 31/01/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

#import "NetworkRequest.h"

@implementation NetworkRequest

- (instancetype)initWithHTTPMethod:(nullable NSString *)httpMethod requestURLString:(nullable NSString *)requestURLString parameters:(nullable NSDictionary *)parameters {

	self = [super init];

	if (self == nil) {
		return nil;
	}

	self.httpMethod = httpMethod;
	self.requestURLString = requestURLString;
	self.parameters = parameters;
	
	return self;
}

@end
