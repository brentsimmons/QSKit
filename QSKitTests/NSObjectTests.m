//
//  NSObjectTests.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSObject+QSKit.h"


@interface NSObjectTests : XCTestCase

@end

@implementation NSObjectTests


- (void)testQSIsEmpty {

	XCTAssertTrue(QSIsEmpty(nil));

	XCTAssertTrue(QSIsEmpty([NSArray new]));
	XCTAssertTrue(QSIsEmpty([NSMutableArray new]));
	XCTAssertTrue(QSIsEmpty([NSSet new]));
	XCTAssertTrue(QSIsEmpty([NSMutableSet new]));
	XCTAssertTrue(QSIsEmpty([NSData new]));
	XCTAssertTrue(QSIsEmpty([NSMutableData new]));
	XCTAssertTrue(QSIsEmpty([NSDictionary new]));
	XCTAssertTrue(QSIsEmpty([NSMutableDictionary new]));
	XCTAssertTrue(QSIsEmpty([NSOrderedSet new]));
	XCTAssertTrue(QSIsEmpty([NSMutableOrderedSet new]));

	XCTAssertTrue(QSIsEmpty(@""));
	XCTAssertTrue(QSIsEmpty(@[]));
	XCTAssertTrue(QSIsEmpty(@{}));

	XCTAssertFalse(QSIsEmpty(@" "));
	XCTAssertFalse(QSIsEmpty(@"Foo"));

	XCTAssertFalse(QSIsEmpty(@2));

	XCTAssertFalse(QSIsEmpty(@[@""]));
	XCTAssertFalse(QSIsEmpty(@{@"foo" : @"bar"}));

	int somebytes[] = {40, 50, 00, 75, 4000};
	XCTAssertFalse(QSIsEmpty([NSData dataWithBytes:somebytes length:sizeof(somebytes)]));
}

@end
