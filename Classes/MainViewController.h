//
//  MainViewController.h
//  CycleAnalyst
//
//  Created by Frank Schmitt on 2010-12-04.
//  Copyright 2010 Laika Systems. All rights reserved.
//

#import "FlipsideViewController.h"

@class SpeedometerView;

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
	SpeedometerView *speedometerView;
	SpeedometerView *ammeterView;
	SpeedometerView *voltmeterView;
	UIProgressView *chargeView;
	UILabel *odometer;
	UILabel *connectIndicator;
	
	UIWebView *webView;
}

@property (nonatomic, retain) IBOutlet SpeedometerView *speedometerView;
@property (nonatomic, retain) IBOutlet SpeedometerView *ammeterView;
@property (nonatomic, retain) IBOutlet SpeedometerView *voltmeterView;
@property (nonatomic, retain) IBOutlet UIProgressView *chargeView;
@property (nonatomic, retain) IBOutlet UILabel *odometer;
@property (nonatomic, retain) IBOutlet UILabel *connectIndicator;
@property (nonatomic, retain) IBOutlet UIWebView *webView;

- (IBAction)showInfo:(id)sender;

@end
