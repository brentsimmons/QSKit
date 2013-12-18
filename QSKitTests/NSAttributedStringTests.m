//
//  NSAttributedStringTests.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSAttributedString+QSKit.h"


@interface NSAttributedStringTests : XCTestCase
@end


@implementation NSAttributedStringTests


- (void)testQSAttributedStringWithText {

	NSString *text = @"Animals were hiding behind the rocks, except the little fish.";
	NSFont *font = [NSFont systemFontOfSize:18.0f];
	NSColor *color = [NSColor greenColor];

	NSAttributedString *attributedString = [NSAttributedString qs_attributedStringWithText:text font:font color:color kerning:YES];
	XCTAssertNotNil(attributedString);

	NSDictionary *attributes = [attributedString attributesAtIndex:0 effectiveRange:nil];
	id kernAttribute = attributes[NSKernAttributeName];
	XCTAssertEqual(kernAttribute, [NSNull null]);
}

@end
