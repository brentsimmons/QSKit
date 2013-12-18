//
//  NSStringQSDatabaseTests.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 11/1/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+QSDatabase.h"


@interface NSStringQSDatabaseTests : XCTestCase
@end


@implementation NSStringQSDatabaseTests


- (void)testExample {

	XCTAssertThrows([NSString qs_SQLValueListWithPlaceholders:0]);

	XCTAssertNoThrow([NSString qs_SQLValueListWithPlaceholders:1]);
	XCTAssertNoThrow([NSString qs_SQLValueListWithPlaceholders:2]);
	XCTAssertNoThrow([NSString qs_SQLValueListWithPlaceholders:100]);

	XCTAssertEqualObjects([NSString qs_SQLValueListWithPlaceholders:1], @"(?)");
	XCTAssertEqualObjects([NSString qs_SQLValueListWithPlaceholders:2], @"(?, ?)");
	XCTAssertEqualObjects([NSString qs_SQLValueListWithPlaceholders:3], @"(?, ?, ?)");
	XCTAssertEqualObjects([NSString qs_SQLValueListWithPlaceholders:10], @"(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
}

@end
