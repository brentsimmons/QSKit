//
//  QSMathTests.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "QSMath.h"


@interface QSMathTests : XCTestCase
@end


@implementation QSMathTests


static const CGFloat accuracy = 0.001f;

- (void)testQSCeil {

	XCTAssertEqualWithAccuracy(1.0f, QSCeil(0.3f), accuracy);
	XCTAssertEqualWithAccuracy(1.0f, QSCeil(0.003f), accuracy);
	XCTAssertEqualWithAccuracy(1.0f, QSCeil(0.9999f), accuracy);
	XCTAssertEqualWithAccuracy(1.0f, QSCeil(1.0f), accuracy);
	XCTAssertEqualWithAccuracy(67509485.0f, QSCeil(67509485.452f), accuracy);
}


- (void)testQSAbs {

	XCTAssertEqualWithAccuracy(0.3f, QSAbs(0.3f), accuracy);
	XCTAssertEqualWithAccuracy(0.3f, QSAbs(0.3f), accuracy);
	XCTAssertEqualWithAccuracy(100.33f, QSAbs(100.33), accuracy);
	XCTAssertEqualWithAccuracy(100.33f, QSAbs(-100.33), accuracy);
	XCTAssertEqualWithAccuracy(1034958.234f, QSAbs(1034958.234f), accuracy);
	XCTAssertEqualWithAccuracy(1034958.234f, QSAbs(-1034958.234f), accuracy);
}


- (void)testQSFloor {

	XCTAssertEqualWithAccuracy(0.0f, QSFloor(0.3f), accuracy);
	XCTAssertEqualWithAccuracy(0.0f, QSFloor(0.003f), accuracy);
	XCTAssertEqualWithAccuracy(0.0f, QSFloor(0.9999f), accuracy);
	XCTAssertEqualWithAccuracy(1.0f, QSFloor(1.0f), accuracy);
	XCTAssertEqualWithAccuracy(94578234.0f, QSFloor(94578234.34f), accuracy);
}


@end
