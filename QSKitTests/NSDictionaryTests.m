//
//  NSDictionaryTests.m
//  QSKit
//
//  Created by Brent Simmons on 12/18/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDictionary+QSKit.h"


@interface NSDictionaryTests : XCTestCase
@end

@implementation NSDictionaryTests


- (void)testQSObjectForCaseInsensitiveKey {

	NSDictionary *d = @{@"foo" : @"bar"};

	XCTAssertEqualObjects(@"bar", [d qs_objectForCaseInsensitiveKey:@"FOO"]);
	XCTAssertEqualObjects(@"bar", [d qs_objectForCaseInsensitiveKey:@"Foo"]);
	XCTAssertEqualObjects(@"bar", [d qs_objectForCaseInsensitiveKey:@"foo"]);

	XCTAssertNil([d qs_objectForCaseInsensitiveKey:@"bar"]);
	XCTAssertNil([d qs_objectForCaseInsensitiveKey:@"Bar"]);
	XCTAssertNil([d qs_objectForCaseInsensitiveKey:@"BAR"]);

	d = @{@1 : @2, @"FoO" : @"bar"};
	XCTAssertEqualObjects(@"bar", [d qs_objectForCaseInsensitiveKey:@"FOO"]);
	XCTAssertEqualObjects(@"bar", [d qs_objectForCaseInsensitiveKey:@"Foo"]);
	XCTAssertEqualObjects(@"bar", [d qs_objectForCaseInsensitiveKey:@"foo"]);

	d = @{@YES : @100};
	XCTAssertNoThrow([d qs_objectForCaseInsensitiveKey:@"FOO"]);
	XCTAssertNil([d qs_objectForCaseInsensitiveKey:@"Foo"]);
	XCTAssertNil([d qs_objectForCaseInsensitiveKey:@"foo"]);
	XCTAssertNil([d qs_objectForCaseInsensitiveKey:@"fOO"]);
}

@end
