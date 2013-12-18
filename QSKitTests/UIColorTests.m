//
//  UIColorTests.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 11/1/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIColor+QSKit.h"


@interface UIColorTests : XCTestCase
@end


@implementation UIColorTests


static const CGFloat accuracy = 0.01f;


- (void)testQSColorWithHexString {

	UIColor *color = [UIColor qs_colorWithHexString:@"000000"];
	CGFloat red, green, blue, alpha;
	[color getRed:&red green:&green blue:&blue alpha:&alpha];

	XCTAssertEqualWithAccuracy(red, 0.0f, accuracy);
	XCTAssertEqualWithAccuracy(green, 0.0f, accuracy);
	XCTAssertEqualWithAccuracy(blue, 0.0f, accuracy);
	XCTAssertEqualWithAccuracy(alpha, 1.0f, accuracy);

	color = [UIColor qs_colorWithHexString:@"FFFFFF"];
	[color getRed:&red green:&green blue:&blue alpha:&alpha];

	XCTAssertEqualWithAccuracy(red, 1.0f, accuracy);
	XCTAssertEqualWithAccuracy(green, 1.0f, accuracy);
	XCTAssertEqualWithAccuracy(blue, 1.0f, accuracy);
	XCTAssertEqualWithAccuracy(alpha, 1.0f, accuracy);

	color = [UIColor qs_colorWithHexString:@"FF000000"];
	[color getRed:&red green:&green blue:&blue alpha:&alpha];

	XCTAssertEqualWithAccuracy(red, 1.0f, accuracy);
	XCTAssertEqualWithAccuracy(green, 0.0f, accuracy);
	XCTAssertEqualWithAccuracy(blue, 0.0f, accuracy);
	XCTAssertEqualWithAccuracy(alpha, 0.0f, accuracy);

	color = [UIColor qs_colorWithHexString:@"7F7f7F7F"];
	[color getRed:&red green:&green blue:&blue alpha:&alpha];

	XCTAssertEqualWithAccuracy(red, 0.5f, accuracy);
	XCTAssertEqualWithAccuracy(green, 0.5f, accuracy);
	XCTAssertEqualWithAccuracy(blue, 0.5f, accuracy);
	XCTAssertEqualWithAccuracy(alpha, 0.5f, accuracy);
}


- (void)testQSColorWithAlpha {

	UIColor *color = [UIColor qs_colorWithHexString:@"00FF0033"];
	color = [color qs_colorWithAlpha:0.0f];
	CGFloat red, green, blue, alpha;
	[color getRed:&red green:&green blue:&blue alpha:&alpha];

	XCTAssertEqualWithAccuracy(alpha, 0.0f, accuracy);

	color = [color qs_colorWithAlpha:1.0f];
	[color getRed:&red green:&green blue:&blue alpha:&alpha];

	XCTAssertEqualWithAccuracy(alpha, 1.0f, accuracy);

	color = [color qs_colorWithAlpha:0.387f];
	[color getRed:&red green:&green blue:&blue alpha:&alpha];

	XCTAssertEqualWithAccuracy(alpha, 0.387f, accuracy);
}


@end
