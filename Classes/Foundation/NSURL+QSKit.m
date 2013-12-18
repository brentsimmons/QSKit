//
//  NSURL+QSKit.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "NSURL+QSKit.h"
#import "QSHTTPConstants.h"
#import "NSString+QSKit.h"
#import "NSObject+QSKit.h"


@implementation NSURL (QSKit)


- (BOOL)qs_isHTTPSURL {

    return [[self scheme] caseInsensitiveCompare:QSSchemeHTTPS] == NSOrderedSame;
}


- (BOOL)qs_isHTTPURL {

    return [[self scheme] caseInsensitiveCompare:QSSchemeHTTP] == NSOrderedSame;
}


- (BOOL)qs_isHTTPOrHTTPSURL {

	return [self qs_isHTTPURL] || [self qs_isHTTPSURL];
}


- (NSString *)qs_absoluteStringWithHTTPOrHTTPSPrefixRemoved {

    NSString *urlString = [self absoluteString];

	if (QSStringIsEmpty(urlString)) {
		return urlString;
	}

    urlString = [urlString qs_stringByStrippingPrefix:QSPrefixHTTP caseSensitive:NO];
    urlString = [urlString qs_stringByStrippingPrefix:QSPrefixHTTPS caseSensitive:NO];

    return urlString;
}


- (NSString *)qs_absoluteStringWithQueryStripped {

	/*Strips the final query. If there are more than one ? characters, the last one is assumed to be the query.
	 If there's no query, returns [self absoluteString].*/

	NSArray *components = [[self absoluteString] componentsSeparatedByString:@"?"];

	if ([components count] < 2) {
		return [self absoluteString];
	}

	NSMutableArray *mutableComponents = [components mutableCopy];
	[mutableComponents removeLastObject];
	return [mutableComponents componentsJoinedByString:@"?"];
}


- (NSURL *)qs_URLByAppendingQueryDictionary:(NSDictionary *)queryDictionary {

	/*Tried to use NSURLComponents, but it doesn't handle encoding of the values differently than the entire string. Characters allowed in the query component are not necessarily allowed in the individual values.*/

	if (QSIsEmpty(queryDictionary)) {
		return self;
	}

	NSMutableString *queryString = [[NSMutableString alloc] initWithString:@""];

	NSUInteger numberOfKeys = [queryDictionary count];
	NSUInteger i = 0;

	NSArray *keys = [[queryDictionary allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
	for (NSString *oneKey in keys) {

		NSString *encodedKey = [oneKey stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet alphanumericCharacterSet]];
		[queryString appendString:encodedKey];
		[queryString appendString:@"="];

		NSString *oneValue = queryDictionary[oneKey];
		oneValue = [oneValue stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet alphanumericCharacterSet]];
		[queryString appendString:oneValue];

		i++;
		if (i < numberOfKeys) {
			[queryString appendString:@"&"];
		}
	}

	NSString *absoluteString = [self qs_absoluteStringWithQueryStripped];
	NSString *absoluteStringWithQueryAppended = [NSString stringWithFormat:@"%@?%@", absoluteString, queryString];

	return [NSURL URLWithString:absoluteStringWithQueryAppended];
}


@end
