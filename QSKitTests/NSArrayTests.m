//
//  NSArrayTests.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+QSKit.h"


@interface NSArrayTests : XCTestCase
@end

@implementation NSArrayTests


- (void)testSafeObjectAtIndex {

	NSArray *testArray = @[@"first", @"second", @"third", @"fourth"];

	XCTAssertNil([testArray qs_safeObjectAtIndex:4]);
	XCTAssertNotNil([testArray qs_safeObjectAtIndex:3]);
	XCTAssertNotNil([testArray qs_safeObjectAtIndex:0]);

	XCTAssertTrue([testArray qs_safeObjectAtIndex:3] == testArray[3]);

	testArray = @[];

	XCTAssertNil([testArray qs_safeObjectAtIndex:0]);
}

@end
