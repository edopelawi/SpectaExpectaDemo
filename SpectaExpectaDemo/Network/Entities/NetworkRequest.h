//
//  NetworkRequest.h
//  SpectaExpectaDemo
//
//  Created by Ricardo Pramana Suranta on 31/01/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkRequest : NSObject

@property (copy, nonatomic)  NSString * _Nullable httpMethod;
@property (copy, nonatomic)  NSString * _Nullable requestURLString;
@property (copy, nonatomic)  NSDictionary * _Nullable parameters;

- (instancetype)initWithHTTPMethod:(nullable NSString *)httpMethod requestURLString:(nullable NSString *)requestURLString parameters:(nullable NSDictionary *)parameters;

@end

NS_ASSUME_NONNULL_END
