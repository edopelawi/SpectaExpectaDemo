//
//  MockReachabilityService.h
//  SpectaExpectaDemoTests
//
//  Created by Ricardo Pramana Suranta on 31/01/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReachabilityService.h"

NS_ASSUME_NONNULL_BEGIN

@interface MockReachabilityService : NSObject <ReachabilityService>

// MARK: - Mock properties -

/// The value that will be returned when this instance's @p isNetworkAvailable gets called.
@property (nonatomic) BOOL isNetworkAvailableResult;

// MARK: - Mock methods -

/// Marks whether this method's @p isNetworkAvailable gets called.
- (BOOL)isNetworkAvailableCalled;

/// Reset this instance's tracking.
- (void)reset;

// MARK: - ReachabilityService methods

- (BOOL)isNetworkAvailable;

@end

NS_ASSUME_NONNULL_END
