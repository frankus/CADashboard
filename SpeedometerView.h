//
//  SpeedometerView.h
//  CycleAnalyst
//
//  Created by Frank Schmitt on 2010-12-04.
//  Copyright 2010 Laika Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface SpeedometerNeedle : NSObject {
	UIColor *tintColor_;

	float length;
	float width;
}

@property (nonatomic, retain) UIColor *tintColor;
@property (nonatomic, assign) float length;
@property (nonatomic, assign) float width;

- (void)drawLayer:(CALayer*)layer inContext:(CGContextRef)ctx;

@end

@interface SpeedometerView : UIView {
	float minNumber;
	float maxNumber;
	double startAngle;
	double arcLength;
	CGFloat lineWidth;
	float tickIncrement;
	float minorTickIncrement;
	
	float value;
	
	UILabel *textLabel;
	
	CALayer *needleLayer;
	UILabel *label;
	
	SpeedometerNeedle *needle_;
}

@property (nonatomic, assign) float minNumber;
@property (nonatomic, assign) float maxNumber;
@property (nonatomic, assign) double startAngle;
@property (nonatomic, assign) double arcLength;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, assign) float tickInset;
@property (nonatomic, assign) float tickLength;
@property (nonatomic, assign) float minorTickLength;

@property (nonatomic, assign) float value;

@property (nonatomic, readonly) UILabel *textLabel;
@property (nonatomic, readonly) SpeedometerNeedle *needle;

-(void)initialize;

@end
