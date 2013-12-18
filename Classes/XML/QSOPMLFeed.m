//
//  QSOPMLFeed.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 11/1/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "QSOPMLFeed.h"
#import "NSDictionary+QSKit.h"
#import "NSMutableDictionary+QSKit.h"
#import "NSString+QSKit.h"


@implementation QSOPMLFeed


#pragma mark - Class Methods

+ (instancetype)OPMLFeedWithXMLAttributes:(NSDictionary *)attributes {

	QSOPMLFeed *feed = [QSOPMLFeed new];

	/*OPML doesn't always have properly-cased keys*/

	feed.URL = [attributes qs_objectForCaseInsensitiveKey:@"htmlUrl"];
	feed.feedURL = [attributes qs_objectForCaseInsensitiveKey:@"xmlUrl"];

	feed.title = [attributes qs_objectForCaseInsensitiveKey:@"title"];
	if (QSStringIsEmpty(feed.title)) {
		feed.title = [attributes qs_objectForCaseInsensitiveKey:@"text"];
	}

	return feed;
}


#pragma mark - Debugging

- (NSString *)description {

	NSString *s = [super description];
	return  [NSString stringWithFormat:@"%@ - %@ [%@] %@", s, self.title, self.feedURL, self.URL];
}


- (NSDictionary *)dictionaryRepresentation {

	NSMutableDictionary *d = [NSMutableDictionary new];

	[d qs_safeSetObject:self.URL forKey:@"htmlURL"];
	[d qs_safeSetObject:self.feedURL forKey:@"xmlUrl"];
	[d qs_safeSetObject:self.title forKey:@"title"];

	return d;
}


@end
