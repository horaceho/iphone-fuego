//
//  GoAppDelegate.m
//  Go
//
//  Created by Horace Ho on 09/11/13.
//  Copyright Horace Ho 2009. All rights reserved.
//

#import "GoAppDelegate.h"
#import "GoEngineViewController.h"

@implementation GoAppDelegate

@synthesize window;
@synthesize viewController;

- (void)applicationDidFinishLaunching:(UIApplication *)application 
{    
	NSLog(@"%@::%@", [[self class] description], NSStringFromSelector(_cmd));
    // Override point for customization after app launch    
	[window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc 
{
	NSLog(@"%@::%@", [[self class] description], NSStringFromSelector(_cmd));
    [viewController release];
    [window release];
    [super dealloc];
}


@end
