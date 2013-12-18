//
//  NSMutableDictionaryTests.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSMutableDictionary+QSKit.h"


@interface NSMutableDictionaryTests : XCTestCase
@end


@implementation NSMutableDictionaryTests


- (void)testQSSafeSetObject {

	NSMutableDictionary *d = [NSMutableDictionary new];

	XCTAssertNoThrow([d qs_safeSetObject:@"foo" forKey:nil]);
	XCTAssertNoThrow([d qs_safeSetObject:nil forKey:nil]);
	XCTAssertNoThrow([d qs_safeSetObject:nil forKey:@"bar"]);
	XCTAssertNoThrow([d qs_safeSetObject:@"foo" forKey:@"bar"]);
	XCTAssertNotNil(d[@"bar"]);
}

@end
