//
//  GoEngineViewController.m
//  Go
//
//  Created by Horace Ho on 28/01/2011.
//  Copyright 2011 Horace Ho. All rights reserved.
//

#import "GoEngineViewController.h"

#include "SgSystem.h"
#include "FuegoMainEngine.h"
#include "FuegoMainUtil.h"
#include "GoInit.h"
#include "SgDebug.h"
#include "SgException.h"
#include "SgInit.h"

#include <iostream>
using namespace std;

@implementation GoEngineViewController

@synthesize commandBar;
@synthesize consoleLog;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	NSLog(@"%@::%@", [[self class] description], NSStringFromSelector(_cmd));
    [super viewDidLoad];
	
	SgInit();
	GoInit();
	SgRandom::SetSeed(0);
	
	engine = new FuegoMainEngine(19);

	self.consoleLog.text = @"";
	[consoleLog setFont:[UIFont fontWithName:@"Courier" size:11.0]];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning 
{
	NSLog(@"%@::%@", [[self class] description], NSStringFromSelector(_cmd));
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload 
{
	NSLog(@"%@::%@", [[self class] description], NSStringFromSelector(_cmd));
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	self.commandBar = nil;
	self.consoleLog = nil;
}

#pragma mark -
#pragma mark UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	NSLog(@"%@::%@", [[self class] description], NSStringFromSelector(_cmd));
	[self.commandBar resignFirstResponder];
	
	try	
    {
		istringstream i([self.commandBar.text UTF8String]);
		ostringstream o;
		GtpInputStream  gi(i);
		GtpOutputStream go(o);
		engine->MainLoop(gi, go);
		printf("%s\n", o.str().c_str());
		self.consoleLog.text = [self.consoleLog.text stringByAppendingString:[NSString stringWithUTF8String:o.str().c_str()]];
    }
    catch (const exception& e)
    {
		ostringstream o;
		o << e.what();
	 //	printf("%s\n", o.str().c_str());
		cerr << e.what() << '\n';
    }	
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
	NSLog(@"%@::%@", [[self class] description], NSStringFromSelector(_cmd));
	[self.commandBar resignFirstResponder];
}

- (void)viewWillAppear:(BOOL)animated
{
	NSLog(@"%@::%@", [[self class] description], NSStringFromSelector(_cmd));
}

- (void)viewDidAppear:(BOOL)animated
{
	NSLog(@"%@::%@", [[self class] description], NSStringFromSelector(_cmd));
}

- (void)viewWillDisappear:(BOOL)animated
{
	NSLog(@"%@::%@", [[self class] description], NSStringFromSelector(_cmd));
}

- (void)viewDidDisappear:(BOOL)animated
{
	NSLog(@"%@::%@", [[self class] description], NSStringFromSelector(_cmd));
}

- (void)dealloc 
{
	[commandBar release];
	[consoleLog release];
	
	if (engine) {
		delete engine;
		engine = NULL;
	}

    [super dealloc];
}


@end
