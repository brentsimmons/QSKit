//
//  QSSAXParser.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/25/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import Foundation;
#import <libxml/tree.h>


/*Thread-safe, not re-entrant.

 Calls to the delegate will happen on the same thread where the parser runs.
 
 This is a low-level streaming XML parser, a thin wrapper for libxml2's SAX parser. It doesn't do much Foundation-ifying quite on purpose -- because the goal is performance and low memory use.
 
 Most of the time, NSXMLDocument or NSXMLParser will be the better choice.
 
 This class is not meant to be sub-classed. Use the delegate methods.
 */


@class QSSAXParser;

@protocol QSSAXParserDelegate <NSObject>

@optional

- (void)saxParser:(QSSAXParser *)SAXParser XMLStartElement:(const xmlChar *)localName prefix:(const xmlChar *)prefix uri:(const xmlChar *)uri numberOfNamespaces:(NSInteger)numberOfNamespaces namespaces:(const xmlChar **)namespaces numberOfAttributes:(NSInteger)numberOfAttributes numberDefaulted:(int)numberDefaulted attributes:(const xmlChar **)attributes;

- (void)saxParser:(QSSAXParser *)SAXParser XMLEndElement:(const xmlChar *)localName prefix:(const xmlChar *)prefix uri:(const xmlChar *)uri;

- (void)saxParser:(QSSAXParser *)SAXParser XMLCharactersFound:(const xmlChar *)characters length:(NSUInteger)length;

- (void)saxParserDidReachEndOfDocument:(QSSAXParser *)SAXParser; /*If canceled, may not get called (but might).*/

@end


/*For use by delegate.*/

BOOL QSSAXEqualTags(const xmlChar *localName, const char *tag, NSInteger tagLength);

/*Delegate can call from within XMLStartElement. Returns nil if numberOfAttributes < 1.*/

NSDictionary *QSSAXAttributesDictionary(const xmlChar **attributes, NSInteger numberOfAttributes);


@interface QSSAXParser : NSObject

- (instancetype)initWithDelegate:(id<QSSAXParserDelegate>)delegate;

- (void)parseData:(NSData *)data;
- (void)parseBytes:(const void *)bytes numberOfBytes:(NSUInteger)numberOfBytes;
- (void)finishParsing;
- (void)cancel;

@property (nonatomic, strong, readonly) NSData *currentCharacters; /*nil if not storing characters. UTF-8 encoded.*/
@property (nonatomic, strong, readonly) NSString *currentString; /*Convenience to get string version of currentCharacters.*/

- (void)beginStoringCharacters; /*Delegate can call from XMLStartElement. Characters will be available in XMLEndElement as currentCharacters property. Storing characters is stopped after each XMLEndElement.*/

@end
