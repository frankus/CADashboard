//
//  CycleAnalystAppDelegate.m
//  CycleAnalyst
//
//  Created by Frank Schmitt on 2010-12-04.
//  Copyright 2010 Laika Systems. All rights reserved.
//

#import "CycleAnalystAppDelegate.h"
#import "MainViewController.h"
#import "SpeedometerView.h"
#import <ExternalAccessory/ExternalAccessory.h>

@implementation CycleAnalystAppDelegate


@synthesize window;
@synthesize mainViewController;

char lineBuffer[50];
int lineIndex;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    [self.window addSubview:mainViewController.view];
    [self.window makeKeyAndVisible];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(accessoryConnected) name:EAAccessoryDidConnectNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(accessoryDisconnected) name:EAAccessoryDidDisconnectNotification object:nil];

	[self checkConnected];
	
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
	[[EAAccessoryManager sharedAccessoryManager] unregisterForLocalNotifications];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	[self checkConnected];
	
	[[EAAccessoryManager sharedAccessoryManager] registerForLocalNotifications];
}

#pragma mark -
#pragma mark SkyWire Stuff

- (void)checkConnected {
	if ([[[EAAccessoryManager sharedAccessoryManager] connectedAccessories] count]) {
		EAAccessory *accessory = [[[EAAccessoryManager sharedAccessoryManager] connectedAccessories] objectAtIndex:0];
		
		if ([accessory.protocolStrings containsObject:@"com.southernstars.sw9a"])
			[self accessoryConnected];
	}	
}

- (void)accessoryConnected {
	EAAccessory *accessory = [[[EAAccessoryManager sharedAccessoryManager] connectedAccessories] objectAtIndex:0];
	
	session = [[EASession alloc] initWithAccessory:accessory forProtocol:@"com.southernstars.sw9a"];
	
	if (session) {
		[[session inputStream] setDelegate:self];
		[[session inputStream] scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
		[[session inputStream] open];
		
		[[session outputStream] setDelegate:self];
		[[session outputStream] scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
		[[session outputStream] open];
	}
	
	[self.mainViewController.connectIndicator setHidden:NO];
	[UIApplication sharedApplication].idleTimerDisabled = YES;
}

- (void)accessoryDisconnected {
	[self.mainViewController.connectIndicator setHidden:YES];
	[UIApplication sharedApplication].idleTimerDisabled = NO;
	
	[session release];
	session = nil;
}

- (void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode {
	if (eventCode == NSStreamEventHasBytesAvailable) {
		NSInputStream *stream = (NSInputStream *)aStream;
		uint8_t buffer[130];
		NSUInteger len;
		
		if ((len = [stream read:buffer maxLength:129]) > 0) {
			unsigned char c = buffer[0];
			int j = 0;
			
			while (c != '\n' && lineIndex < 50 && j < len) {
				c = buffer[j ++];
				
				if ((c >= 0x20 && c <= 0x7E) || c == 0x09)
					lineBuffer[lineIndex ++] = c;
			}
			
			if (c == '\n') {
				lineBuffer[lineIndex ++] = '\0';
				
				float ampHours;
				float volts;
				float amps; 
				float speed;
				float distance;
				
				if (sscanf(lineBuffer, " %f\t%f\t%f\t%f\t%f ", &ampHours, &volts, &amps, &speed, &distance)) {
					self.mainViewController.speedometerView.value = speed;
					self.mainViewController.chargeView.progress = ampHours / 4.0;
					self.mainViewController.ammeterView.value = amps;
					self.mainViewController.voltmeterView.value = volts;
					self.mainViewController.odometer.text = [NSString stringWithFormat:@"%09.3f", distance];
				}
							
				lineIndex = 0;
			}
		}
	}
}

#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
}

- (void)dealloc {
    [mainViewController release];
    [window release];
    [super dealloc];
}

@end
