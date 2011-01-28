//
//  GoEngineViewController.h
//  Go
//
//  Created by Horace Ho on 28/01/2011.
//  Copyright 2011 Horace Ho. All rights reserved.
//

#import <UIKit/UIKit.h>

class FuegoMainEngine;

@interface GoEngineViewController : UIViewController <UISearchBarDelegate, UITextViewDelegate>
{
	FuegoMainEngine *engine;
	UISearchBar	*commandBar;
	UITextView  *consoleLog;
}

@property (nonatomic, retain) IBOutlet UISearchBar *commandBar;
@property (nonatomic, retain) IBOutlet UITextView  *consoleLog;

@end
