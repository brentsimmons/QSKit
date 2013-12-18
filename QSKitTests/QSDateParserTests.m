//
//  QSDateParserTests.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 12/18/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "QSDateParser.h"


@interface QSDateParserTests : XCTestCase
@end

@implementation QSDateParserTests


- (void)testDateParser {

	NSDate *expectedDateResult = [NSDate dateWithString:@"2014-03-26 10:05:46 -0700"];
	XCTAssertNotNil(expectedDateResult);

	XCTAssertEqualObjects(QSDateWithString(@"Wed, 26 Mar 2014 17:05:46 +0000"), expectedDateResult);
	XCTAssertEqualObjects(QSDateWithString(@"Wed, 26 Mar 2014 17:05:46 +00:00"), expectedDateResult);
	XCTAssertEqualObjects(QSDateWithString(@"Wed, 26 Mar 2014 17:05:46 -00:00"), expectedDateResult);
	XCTAssertEqualObjects(QSDateWithString(@"Wed, 26 Mar 2014 17:05:46 -0000"), expectedDateResult);
	XCTAssertEqualObjects(QSDateWithString(@"Wed, 26 Mar 2014 17:05:46 GMT"), expectedDateResult);
	XCTAssertEqualObjects(QSDateWithString(@"2014-03-26T17:05:46+00:00"), expectedDateResult);
	XCTAssertEqualObjects(QSDateWithString(@"2014-03-26T17:05:46+0000"), expectedDateResult);
	XCTAssertEqualObjects(QSDateWithString(@"2014-03-26T17:05:46-0000"), expectedDateResult);
	XCTAssertEqualObjects(QSDateWithString(@"2014-03-26T17:05:46-00:00"), expectedDateResult);
	XCTAssertEqualObjects(QSDateWithString(@"2014-03-26T17:05:46Z"), expectedDateResult);
	XCTAssertEqualObjects(QSDateWithString(@"2014-03-26T17:05:46.000Z"), expectedDateResult);

	expectedDateResult = [NSDate dateWithString:@"2014-03-26 17:06:40 +0000"];
	XCTAssertNotNil(expectedDateResult);
	XCTAssertEqualObjects(QSDateWithString(@"2014-03-26T17:06:40+00:00"), expectedDateResult);

	expectedDateResult = [NSDate dateWithString:@"2014-04-30 05:00:00 -0700"];
	XCTAssertNotNil(expectedDateResult);
	XCTAssertEqualObjects(QSDateWithString(@"30 Apr 2014 5:00 PDT"), expectedDateResult);

	expectedDateResult = [NSDate dateWithString:@"2014-05-21 21:22:53 -0000"];
	XCTAssertNotNil(expectedDateResult);
	XCTAssertEqualObjects(QSDateWithString(@"21 May 2014 14:22:53 PDT"), expectedDateResult);

	expectedDateResult = [NSDate dateWithString:@"2010-06-09 05:00:00 +0000"];
	XCTAssertNotNil(expectedDateResult);
	XCTAssertEqualObjects(QSDateWithString(@"Wed, 09 Jun 2010 00:00 EST"), expectedDateResult);

	expectedDateResult = [NSDate dateWithString:@"2010-06-23 03:43:50 +0000"];
	XCTAssertNotNil(expectedDateResult);
	XCTAssertEqualObjects(QSDateWithString(@"Wed, 23 Jun 2010 03:43:50 Z"), expectedDateResult);

	expectedDateResult = [NSDate dateWithString:@"2010-06-22 03:57:49 +0000"];
	XCTAssertNotNil(expectedDateResult);
	XCTAssertEqualObjects(QSDateWithString(@"2010-06-22T03:57:49+00:00"), expectedDateResult);

	expectedDateResult = [NSDate dateWithString:@"2019-11-17 08:40:07 -0500"];
	XCTAssertNotNil(expectedDateResult);
	XCTAssertEqualObjects(QSDateWithString(@"2019-11-17T08:40:07-05:00"), expectedDateResult);

	expectedDateResult = [NSDate dateWithString:@"2050-11-17 08:40:07 -0500"];
	XCTAssertNotNil(expectedDateResult);
	XCTAssertEqualObjects(QSDateWithString(@"2050-11-17T08:40:07-05:00"), expectedDateResult);
}

@end
