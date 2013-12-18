//
//  QSPlatformTests.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "QSPlatform.h"


@interface QSPlatformTests : XCTestCase
@end


@implementation QSPlatformTests


- (void)testQSDataFolder {

	NSString *dataFolder = QSDataFolder(@"QSKit");
	XCTAssertNotNil(dataFolder);

#if !TARGET_OS_IPHONE
	XCTAssertTrue([dataFolder hasSuffix:@"/Library/Application Support/QSKit"]);
#endif

}

@end
