//
//  ReachabilityService.h
//  SpectaExpectaDemo
//
//  Created by Ricardo Pramana Suranta on 31/01/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

#ifndef ReachabilityService_h
#define ReachabilityService_h

#import <Foundation/Foundation.h>

@protocol ReachabilityService <NSObject>

/// Informs whether network connection is reachable or not.
- (BOOL)isNetworkAvailable;

@end
#endif /* ReachabilityService_h */
