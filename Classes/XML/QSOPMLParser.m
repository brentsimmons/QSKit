//
//  QSOPMLParser.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 11/1/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "QSOPMLParser.h"
#import "QSNode.h"
#import "QSSAXParser.h"
#import "QSOPMLFolder.h"
#import "QSOPMLFeed.h"
#import "NSObject+QSKit.h"


@interface QSOPMLParser () <QSSAXParserDelegate>

@property (nonatomic, readwrite) QSNode *rootNode;
@property (nonatomic, readwrite) QSSAXParser *parser;
@property (nonatomic, readonly) NSMutableArray *nodeStack;
@end


@implementation QSOPMLParser


#pragma mark - Init

- (instancetype)init {

	self = [super init];
	if (self == nil) {
		return nil;
	}

	_rootNode = [QSNode nodeWithRepresentedObject:nil parent:nil];
	_nodeStack = [NSMutableArray new];
	[_nodeStack addObject:_rootNode];
	
	_parser = [[QSSAXParser alloc] initWithDelegate:self];

	return self;
}

#pragma mark - API

- (void)parseOPMLData:(NSData *)data {
	[self.parser parseData:data];
}


- (void)finishParsing {
	[self.parser finishParsing];
}


#pragma mark - Node Stack

- (void)popNode {

	NSAssert(!QSIsEmpty(self.nodeStack), nil);

	/*If self.nodeStack is empty, bad things are happening.
	 But we still shouldn't crash in production.*/

	if (!QSIsEmpty(self.nodeStack)) {
		[self.nodeStack removeLastObject];
	}
}


- (void)pushNode:(QSNode *)node {
	[self.nodeStack addObject:node];
}


- (QSNode *)currentNode {
	return [self.nodeStack lastObject];
}


#pragma mark - RepresentedObjects

static id representedObjectWithXMLAttributes(NSDictionary *XMLAttributes) {

	for (NSString *oneKey in [XMLAttributes allKeys]) {

		if ([oneKey caseInsensitiveCompare:@"xmlUrl"] == NSOrderedSame) {
			return [QSOPMLFeed OPMLFeedWithXMLAttributes:XMLAttributes];
		}
	}

	return [QSOPMLFolder OPMLFolderWithXMLAttributes:XMLAttributes];
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
	id representedObject = representedObjectWithXMLAttributes(XMLAttributes);

	QSNode *currentNode = [self currentNode];
	QSNode *node = [QSNode nodeWithRepresentedObject:representedObject parent:currentNode];
	[currentNode addChildren:@[node]];

	[self pushNode:node];
}


- (void)saxParser:(QSSAXParser *)SAXParser XMLEndElement:(const xmlChar *)localName prefix:(const xmlChar *)prefix uri:(const xmlChar *)uri {

	#pragma unused(SAXParser, prefix, uri)

	if (QSSAXEqualTags(localName, kOutlineTag, kOutlineTagLength)) {
		[self popNode];
	}
}


@end
