//
//  MainViewController.m
//  CycleAnalyst
//
//  Created by Frank Schmitt on 2010-12-04.
//  Copyright 2010 Laika Systems. All rights reserved.
//

#import "MainViewController.h"
#import "SpeedometerView.h"


@implementation MainViewController

@synthesize speedometerView, ammeterView, voltmeterView, chargeView, odometer, connectIndicator;
@synthesize webView;

- (void)viewDidLoad {
	[super viewDidLoad];
	
	chargeView.transform = CGAffineTransformMakeRotation(M_PI / -2.0);
	
	self.speedometerView.textLabel.text = @"km/h";
	self.speedometerView.textLabel.font = [UIFont boldSystemFontOfSize:18.0];
	self.speedometerView.lineWidth = 2.0;
	self.speedometerView.maxNumber = 50;
	self.speedometerView.startAngle = M_PI - M_PI / 4.0;
	self.speedometerView.needle.width = 4.0;
	self.speedometerView.textLabel.textColor = [UIColor colorWithRed:0.8 green:0.9 blue:1.0 alpha:1.0];
	
	self.speedometerView.value = 0.0;
	
	self.ammeterView.textLabel.text = @"A";
	self.ammeterView.textLabel.font = [UIFont boldSystemFontOfSize:12.0];
	self.ammeterView.lineWidth = 1.0;
	self.ammeterView.minNumber = -50;
	self.ammeterView.maxNumber = 50;
	self.ammeterView.startAngle = M_PI - M_PI / 4.0;
	self.ammeterView.textLabel.textColor = [UIColor colorWithRed:0.8 green:0.9 blue:1.0 alpha:1.0];

	self.ammeterView.value = 0.0;

	self.voltmeterView.textLabel.text = @"V";
	self.voltmeterView.textLabel.font = [UIFont boldSystemFontOfSize:12.0];
	self.voltmeterView.lineWidth = 1.0;
	self.voltmeterView.maxNumber = 50;
	self.voltmeterView.startAngle = M_PI - M_PI / 4.0;
	self.voltmeterView.textLabel.textColor = [UIColor colorWithRed:0.8 green:0.9 blue:1.0 alpha:1.0];

	self.voltmeterView.value = 0.0;
	
	self.connectIndicator.layer.cornerRadius = 8.5;
	
	[self.webView loadHTMLString:@"<html><body>Hey!</body></html>" baseURL:nil];
}

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo:(id)sender {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}



- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
	self.speedometerView = nil;
	self.voltmeterView = nil;
	self.ammeterView = nil;
	self.chargeView = nil;
	self.odometer = nil;
	self.connectIndicator = nil;
	self.webView = nil;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)dealloc {
	[speedometerView release];
	[voltmeterView release];
	[ammeterView release];
	[chargeView release];
	[odometer release];
	[connectIndicator release];
	[webView release];
	
    [super dealloc];
}


@end
