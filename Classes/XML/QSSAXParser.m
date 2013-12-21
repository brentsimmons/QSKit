//
//  QSSAXParser.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/25/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "QSSAXParser.h"
#import "NSObject+QSKit.h"


@interface QSSAXParser ()

@property (nonatomic, weak) id<QSSAXParserDelegate> delegate;
@property (nonatomic, assign) xmlParserCtxtPtr context;
@property (nonatomic, assign) BOOL storingCharacters;
@property (nonatomic) NSMutableData *characters;

@end



@implementation QSSAXParser

+ (void)initialize {

	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		xmlInitParser();
	});
}


#pragma mark - Init

- (instancetype)initWithDelegate:(id<QSSAXParserDelegate>)delegate {

	self = [super init];
	if (self == nil)
		return nil;

	_delegate = delegate;

	return self;
}


#pragma mark - Dealloc

- (void)dealloc {
	if (_context != nil) {
		xmlFreeParserCtxt(_context);
		_context = nil;
	}
}


#pragma mark - API

static xmlSAXHandler saxHandlerStruct;

- (void)parseData:(NSData *)data {

	if (self.context == nil) {

		self.context = xmlCreatePushParserCtxt(&saxHandlerStruct, (__bridge void *)self, nil, 0, nil);
		xmlCtxtUseOptions(self.context, XML_PARSE_RECOVER | XML_PARSE_NOENT);
	}

	@autoreleasepool {
		xmlParseChunk(self.context, (const char *)[data bytes], (int)[data length], 0);
	}
}


- (void)parseBytes:(const void *)bytes numberOfBytes:(NSUInteger)numberOfBytes {

	if (self.context == nil) {

		self.context = xmlCreatePushParserCtxt(&saxHandlerStruct, (__bridge void *)self, nil, 0, nil);
		xmlCtxtUseOptions(self.context, XML_PARSE_RECOVER | XML_PARSE_NOENT);
	}

	@autoreleasepool {
		xmlParseChunk(self.context, (const char *)bytes, (int)numberOfBytes, 0);
	}
}


- (void)finishParsing {

	NSAssert(self.context != nil, nil);
	if (self.context == nil)
		return;

	@autoreleasepool {
		xmlParseChunk(self.context, nil, 0, 1);
		xmlFreeParserCtxt(self.context);
		self.context = nil;
		self.characters = nil;
	}
}


- (void)cancel {

	@autoreleasepool {
		xmlStopParser(self.context);
		xmlFreeParserCtxt(self.context);
		self.context = nil;
		self.characters = nil;
	}
}


- (void)beginStoringCharacters {
	self.storingCharacters = YES;
	self.characters = [NSMutableData new];
}


- (void)endStoringCharacters {
	self.storingCharacters = NO;
	self.characters = nil;
}


- (NSData *)currentCharacters {

	if (!self.storingCharacters) {
		return nil;
	}

	return self.characters;
}


- (NSString *)currentString {

	NSData *d = self.currentCharacters;
	if (QSIsEmpty(d)) {
		return nil;
	}

	return [[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding];
}


#pragma mark - Attributes Dictionary

NSDictionary *QSSAXAttributesDictionary(const xmlChar **attributes, NSInteger numberOfAttributes) {

	if (numberOfAttributes < 1 || attributes == NULL) {
		return nil;
	}

	NSMutableDictionary *d = [NSMutableDictionary new];

	@autoreleasepool {
		NSInteger i = 0, j = 0;
		for (i = 0, j = 0; i < numberOfAttributes; i++, j+=5) {

			NSUInteger lenValue = (NSUInteger)(attributes[j + 4] - attributes[j + 3]);

			NSMutableString *value = [[NSMutableString alloc] initWithBytes:(const void *)attributes[j + 3] length:lenValue encoding:NSUTF8StringEncoding];

			NSString *attributeName = [NSString stringWithUTF8String:(const char *)attributes[j]];
			if (attributes[j + 1] != NULL) {
				NSString *attributePrefix = [NSString stringWithUTF8String:(const char *)attributes[j + 1]];
				attributeName = [NSString stringWithFormat:@"%@:%@", attributePrefix, attributeName];
			}

			if (value != nil && attributeName != nil) {
				d[attributeName] = value;
			}
		}
	}
	
	return d;
}


#pragma mark - Equal Tags

BOOL QSSAXEqualTags(const xmlChar *localName, const char *tag, NSInteger tagLength) {

	return !strncmp((const char *)localName, tag, (size_t)tagLength);
}


#pragma mark - Callbacks

- (void)xmlEndDocument {

	@autoreleasepool {
		if ([self.delegate respondsToSelector:@selector(saxParserDidReachEndOfDocument:)]) {
			[self.delegate saxParserDidReachEndOfDocument:self];
		}

		[self endStoringCharacters];
	}
}


- (void)xmlCharactersFound:(const xmlChar *)ch length:(NSUInteger)length {

	@autoreleasepool {
		if (self.storingCharacters) {
			[self.characters appendBytes:(const void *)ch length:length];
		}

		if ([self.delegate respondsToSelector:@selector(saxParser:XMLCharactersFound:length:)]) {
			[self.delegate saxParser:self XMLCharactersFound:ch length:length];
		}
	}
}


- (void)xmlStartElement:(const xmlChar *)localName prefix:(const xmlChar *)prefix uri:(const xmlChar *)uri numberOfNamespaces:(int)numberOfNamespaces namespaces:(const xmlChar **)namespaces numberOfAttributes:(int)numberOfAttributes numberDefaulted:(int)numberDefaulted attributes:(const xmlChar **)attributes {

	@autoreleasepool {
		if ([self.delegate respondsToSelector:@selector(saxParser:XMLStartElement:prefix:uri:numberOfNamespaces:namespaces:numberOfAttributes:numberDefaulted:attributes:)]) {

			[self.delegate saxParser:self XMLStartElement:localName prefix:prefix uri:uri numberOfNamespaces:numberOfNamespaces namespaces:namespaces numberOfAttributes:numberOfAttributes numberDefaulted:numberDefaulted attributes:attributes];
		}
	}
}


- (void)xmlEndElement:(const xmlChar *)localName prefix:(const xmlChar *)prefix uri:(const xmlChar *)uri {

	@autoreleasepool {
		if ([self.delegate respondsToSelector:@selector(saxParser:XMLEndElement:prefix:uri:)]) {
			[self.delegate saxParser:self XMLEndElement:localName prefix:prefix uri:uri];
		}

		[self endStoringCharacters];
	}
}


@end


static void startElementSAX(void *context, const xmlChar *localname, const xmlChar *prefix, const xmlChar *URI, int nb_namespaces, const xmlChar **namespaces, int nb_attributes, int nb_defaulted, const xmlChar **attributes) {

	[(__bridge QSSAXParser *)context xmlStartElement:localname prefix:prefix uri:URI numberOfNamespaces:nb_namespaces namespaces:namespaces numberOfAttributes:nb_attributes numberDefaulted:nb_defaulted attributes:attributes];
}


static void	endElementSAX(void *context, const xmlChar *localname, const xmlChar *prefix, const xmlChar *URI) {
	[(__bridge QSSAXParser *)context xmlEndElement:localname prefix:prefix uri:URI];
}


static void	charactersFoundSAX(void *context, const xmlChar *ch, int len) {
	[(__bridge QSSAXParser *)context xmlCharactersFound:ch length:(NSUInteger)len];
}


static void endDocumentSAX(void *context) {
	[(__bridge QSSAXParser *)context xmlEndDocument];
}


static xmlSAXHandler saxHandlerStruct = {
	nil,					/* internalSubset */
	nil,					/* isStandalone   */
	nil,					/* hasInternalSubset */
	nil,					/* hasExternalSubset */
	nil,					/* resolveEntity */
	nil,					/* getEntity */
	nil,					/* entityDecl */
	nil,					/* notationDecl */
	nil,					/* attributeDecl */
	nil,					/* elementDecl */
	nil,					/* unparsedEntityDecl */
	nil,					/* setDocumentLocator */
	nil,					/* startDocument */
	endDocumentSAX,			/* endDocument */
	nil,					/* startElement*/
	nil,					/* endElement */
	nil,					/* reference */
	charactersFoundSAX,		/* characters */
	nil,					/* ignorableWhitespace */
	nil,					/* processingInstruction */
	nil,					/* comment */
	nil,					/* warning */
	nil,					/* error */
	nil,					/* fatalError //: unused error() get all the errors */
	nil,					/* getParameterEntity */
	nil,					/* cdataBlock */
	nil,					/* externalSubset */
	XML_SAX2_MAGIC,
	nil,
	startElementSAX,		/* startElementNs */
	endElementSAX,			/* endElementNs */
	nil						/* serror */
};

