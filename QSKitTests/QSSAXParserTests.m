//
//  QSSAXParserTests.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 11/1/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "QSSAXParser.h"


@interface QSSimpleDelegate : NSObject<QSSAXParserDelegate>

@property (nonatomic, assign) BOOL didReachEndOfDocument;
@property (nonatomic, assign) BOOL didFindXMLCharacters;
@property (nonatomic, assign) BOOL didEndXMLElement;
@property (nonatomic, assign) BOOL didStartFooElement;
@property (nonatomic, assign) BOOL didEndFooElement;
@property (nonatomic) NSDictionary *XMLAttributes;
@property (nonatomic) NSString *barValue;

@end


@implementation QSSimpleDelegate

- (void)saxParser:(QSSAXParser *)SAXParser XMLStartElement:(const xmlChar *)localName prefix:(const xmlChar *)prefix uri:(const xmlChar *)uri numberOfNamespaces:(NSInteger)numberOfNamespaces namespaces:(const xmlChar **)namespaces numberOfAttributes:(NSInteger)numberOfAttributes numberDefaulted:(int)numberDefaulted attributes:(const xmlChar **)attributes {

#pragma unused(namespaces, prefix, uri, numberOfNamespaces, numberDefaulted)

	if (QSSAXEqualTags(localName, "bar", 3)) {

		self.XMLAttributes = QSSAXAttributesDictionary(attributes, numberOfAttributes);
		[SAXParser beginStoringCharacters];
	}

	else if (QSSAXEqualTags(localName, "foo", 3)) {
		self.didStartFooElement = YES;
	}

}


- (void)saxParser:(QSSAXParser *)SAXParser XMLEndElement:(const xmlChar *)localName prefix:(const xmlChar *)prefix uri:(const xmlChar *)uri {

#pragma unused(prefix, uri)

	self.didEndXMLElement = YES;

	if (QSSAXEqualTags(localName, "bar", 3)) {

		NSData *characters = SAXParser.currentCharacters;
		self.barValue = [[NSString alloc] initWithData:characters encoding:NSUTF8StringEncoding];
	}

	else if (QSSAXEqualTags(localName, "foo", 3)) {
		self.didEndFooElement = YES;
	}

}

- (void)saxParser:(QSSAXParser *)SAXParser XMLCharactersFound:(const xmlChar *)characters length:(NSUInteger)length {

#pragma unused(SAXParser, characters, length)

	self.didFindXMLCharacters = YES;
}

- (void)saxParserDidReachEndOfDocument:(QSSAXParser *)SAXParser {

#pragma unused(SAXParser)

	self.didReachEndOfDocument = YES;
}


@end


@interface QSSAXParserTests : XCTestCase
@end

@implementation QSSAXParserTests



- (void)testSimpleParsing {

	QSSimpleDelegate *d = [QSSimpleDelegate new];
	NSString *xml = @"<foo><bar man='5' devil=\"six\" god='7'>Now there’s a hole in the sky &amp; the ground's not cold</bar></foo>";
	NSData *xmlData = [xml dataUsingEncoding:NSUTF8StringEncoding];

	QSSAXParser *parser = [[QSSAXParser alloc] initWithDelegate:d];
	[parser parseData:xmlData];
	[parser finishParsing];

	XCTAssertTrue(d.didReachEndOfDocument);
	XCTAssertTrue(d.didFindXMLCharacters);
	XCTAssertTrue(d.didEndXMLElement);
	XCTAssertTrue(d.didStartFooElement);
	XCTAssertTrue(d.didEndFooElement);

	XCTAssertEqualObjects(d.barValue, @"Now there’s a hole in the sky & the ground's not cold");

	XCTAssertTrue([d.XMLAttributes count] == 3);
	XCTAssertEqualObjects(d.XMLAttributes[@"man"], @"5");
	XCTAssertEqualObjects(d.XMLAttributes[@"devil"], @"six");
	XCTAssertEqualObjects(d.XMLAttributes[@"god"], @"7");
}

@end
