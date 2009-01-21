//
//  LightsOutAppDelegate.m
//  LightsOut
//
//  Created by Alex Watt on 21/01/2009.
//  Copyright Greycourt Software Ltd. 2009. All rights reserved.
//

#import "LightsOutAppDelegate.h"
#import "RootViewController.h"

@implementation LightsOutAppDelegate


@synthesize window;
@synthesize rootViewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
    [window addSubview:[rootViewController view]];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [rootViewController release];
    [window release];
    [super dealloc];
}

@end
