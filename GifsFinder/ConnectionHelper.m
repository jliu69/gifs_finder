//
//  ConnectionHelper.m
//  GifsFinder
//
//  Created by Johnson Liu on 9/11/15.
//  Copyright (c) 2015 HomeOffice. All rights reserved.
//

#import "ConnectionHelper.h"
#import "Reachability.h"


@implementation ConnectionHelper

+ (BOOL)isConnectionAvailable {
    
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    
    if (networkStatus == NotReachable) {
        return NO;
    }
    else {
        return YES;
    }
}

@end
