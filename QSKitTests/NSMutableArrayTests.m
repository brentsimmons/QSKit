//
//  NSMutableArrayTests.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSMutableArray+QSKit.h"


@interface NSMutableArrayTests : XCTestCase
@end

@implementation NSMutableArrayTests


- (void)testQSSafeAddObject {

	NSMutableArray *s = [NSMutableArray new];

	XCTAssertNoThrow([s qs_safeAddObject:nil]);

	NSString *foo = @"Foo";
	XCTAssertNoThrow([s qs_safeAddObject:foo]);
	XCTAssertTrue([s containsObject:foo]);
}

@end
