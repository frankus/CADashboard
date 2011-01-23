//
//  CycleAnalystAppDelegate.h
//  CycleAnalyst
//
//  Created by Frank Schmitt on 2010-12-04.
//  Copyright 2010 Laika Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController, EASession;

@interface CycleAnalystAppDelegate : NSObject <UIApplicationDelegate, NSStreamDelegate> {
    UIWindow *window;
    MainViewController *mainViewController;
	
	EASession *session;
}

- (void)accessoryConnected;
- (void)checkConnected;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MainViewController *mainViewController;

@end

