//
//  NSDateTests.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 11/1/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDate+QSKit.h"


@interface NSDateTests : XCTestCase
@end


@implementation NSDateTests


- (void)testQSDateWithNumberOfDaysInThePast {

	NSUInteger numberOfDays = 100;
	NSTimeInterval expectedTimeInterval = 60 * 60 * 24 * numberOfDays;
	NSDate *actualDate = [NSDate qs_dateWithNumberOfDaysInThePast:numberOfDays];
	NSTimeInterval actualTimeInterval = [actualDate timeIntervalSinceNow];

	XCTAssertEqualWithAccuracy(-expectedTimeInterval, actualTimeInterval, 60 * 60 * 2);
}


- (void)testQSUnixTimestampStringWithNoDecimal {

	NSDate *d = [NSDate dateWithTimeIntervalSince1970:1383339107];
	NSString *s = [d qs_unixTimestampStringWithNoDecimal];

	XCTAssertEqualObjects(s, @"1383339107");

	d = [NSDate dateWithTimeIntervalSince1970:500];
	s = [d qs_unixTimestampStringWithNoDecimal];

	XCTAssertEqualObjects(s, @"500");

	d = [NSDate dateWithTimeIntervalSince1970:2343349107];
	s = [d qs_unixTimestampStringWithNoDecimal];

	XCTAssertEqualObjects(s, @"2343349107");

}

@end
