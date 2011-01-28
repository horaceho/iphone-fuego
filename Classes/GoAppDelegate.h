//
//  GoAppDelegate.h
//  Go
//
//  Created by Horace Ho on 09/11/13.
//  Copyright Horace Ho 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GoEngineViewController;

@interface GoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    GoEngineViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GoEngineViewController *viewController;

@end

