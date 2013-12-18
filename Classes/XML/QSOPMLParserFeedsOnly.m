//
//  QSOPMLParserFeedsOnly.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 11/1/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "QSOPMLParserFeedsOnly.h"
#import "QSOPMLFeed.h"
#import "QSSAXParser.h"
#import "NSMutableArray+QSKit.h"


@interface QSOPMLParserFeedsOnly ()  <QSSAXParserDelegate>

@property (nonatomic) NSMutableArray *parsedFeeds;
@property (nonatomic, readwrite) QSSAXParser *parser;

@end


@implementation QSOPMLParserFeedsOnly


#pragma mark - Init

- (instancetype)init {

	self = [super init];
	if (self == nil) {
		return nil;
	}

	_parser = [[QSSAXParser alloc] initWithDelegate:self];
	_parsedFeeds = [NSMutableArray new];

	return self;

}

#pragma mark - Feeds

- (NSArray *)feeds {
	return [self.parsedFeeds copy];
}


#pragma mark - API

- (void)parseOPMLData:(NSData *)data {
	[self.parser parseData:data];
}


- (void)finishParsing {
	[self.parser finishParsing];
}


#pragma mark - RepresentedObjects

static QSOPMLFeed *feedWithXMLAttributes(NSDictionary *XMLAttributes) {

	for (NSString *oneKey in [XMLAttributes allKeys]) {

		if ([oneKey caseInsensitiveCompare:@"xmlUrl"] == NSOrderedSame) {
			return [QSOPMLFeed OPMLFeedWithXMLAttributes:XMLAttributes];
		}
	}

	return nil;
}


#pragma mark - Delegate

static const char *kOutlineTag = "outline";
static const NSInteger kOutlineTagLength = 7;

- (void)saxParser:(QSSAXParser *)SAXParser XMLStartElement:(const xmlChar *)localName prefix:(const xmlChar *)prefix uri:(const xmlChar *)uri numberOfNamespaces:(NSInteger)numberOfNamespaces namespaces:(const xmlChar **)namespaces numberOfAttributes:(NSInteger)numberOfAttributes numberDefaulted:(int)numberDefaulted attributes:(const xmlChar **)attributes {

	#pragma unused(SAXParser, namespaces, prefix, uri, numberOfNamespaces, numberDefaulted)

	if (!QSSAXEqualTags(localName, kOutlineTag, kOutlineTagLength)) {
		return;
	}

	NSDictionary *XMLAttributes = QSSAXAttributesDictionary(attributes, numberOfAttributes);
	QSOPMLFeed *feed = feedWithXMLAttributes(XMLAttributes);
	[self.parsedFeeds qs_safeAddObject:feed];
}


@end
