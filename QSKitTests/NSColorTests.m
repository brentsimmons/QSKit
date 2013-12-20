//
//  NSColorTests.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSColor+QSKit.h"


@interface NSColorTests : XCTestCase
@end

@implementation NSColorTests


static const CGFloat accuracy = 0.01f;


- (void)testQSColorWithHexString {

	NSColor *color = [NSColor qs_colorWithHexString:@"000000"];
	CGFloat red, green, blue, alpha;
	[color getRed:&red green:&green blue:&blue alpha:&alpha];

	XCTAssertEqualWithAccuracy(red, 0.0f, accuracy);
	XCTAssertEqualWithAccuracy(green, 0.0f, accuracy);
	XCTAssertEqualWithAccuracy(blue, 0.0f, accuracy);
	XCTAssertEqualWithAccuracy(alpha, 1.0f, accuracy);

	color = [NSColor qs_colorWithHexString:@"FFFFFF"];
	[color getRed:&red green:&green blue:&blue alpha:&alpha];

	XCTAssertEqualWithAccuracy(red, 1.0f, accuracy);
	XCTAssertEqualWithAccuracy(green, 1.0f, accuracy);
	XCTAssertEqualWithAccuracy(blue, 1.0f, accuracy);
	XCTAssertEqualWithAccuracy(alpha, 1.0f, accuracy);

	color = [NSColor qs_colorWithHexString:@"FF000000"];
	[color getRed:&red green:&green blue:&blue alpha:&alpha];

	XCTAssertEqualWithAccuracy(red, 1.0f, accuracy);
	XCTAssertEqualWithAccuracy(green, 0.0f, accuracy);
	XCTAssertEqualWithAccuracy(blue, 0.0f, accuracy);
	XCTAssertEqualWithAccuracy(alpha, 0.0f, accuracy);

	color = [NSColor qs_colorWithHexString:@"7F7f7F7F"];
	[color getRed:&red green:&green blue:&blue alpha:&alpha];

	XCTAssertEqualWithAccuracy(red, 0.5f, accuracy);
	XCTAssertEqualWithAccuracy(green, 0.5f, accuracy);
	XCTAssertEqualWithAccuracy(blue, 0.5f, accuracy);
	XCTAssertEqualWithAccuracy(alpha, 0.5f, accuracy);
}


@end
