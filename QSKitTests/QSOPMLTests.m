//
//  QSOPMLTests.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 11/1/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "QSOPMLParser.h"
#import "QSNode.h"


@interface QSOPMLTests : XCTestCase
@end


@implementation QSOPMLTests


- (void)testOPMLParser {

	NSString *f = [[NSBundle bundleForClass:[self class]] pathForResource:@"subscriptions" ofType:@"opml"];
	NSData *d = [NSData dataWithContentsOfFile:f];

	QSOPMLParser *parser = [QSOPMLParser new];
	[parser parseOPMLData:d];
	[parser finishParsing];

	NSDictionary *parsedDictionary = [parser.rootNode dictionaryRepresentation];

	NSString *plistPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"subscriptions" ofType:@"plist"];
	NSDictionary *expectedDictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];

	XCTAssertEqualObjects(parsedDictionary, expectedDictionary);
}


@end
