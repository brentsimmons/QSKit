//
//  QSOPMLFolder.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 11/1/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "QSOPMLFolder.h"
#import "NSString+QSKit.h"
#import "NSDictionary+QSKit.h"
#import "NSMutableDictionary+QSKit.h"


@implementation QSOPMLFolder


#pragma mark - Class Methods

+ (instancetype)OPMLFolderWithXMLAttributes:(NSDictionary *)attributes {

	QSOPMLFolder *folder = [QSOPMLFolder new];

	/*OPML doesn't always have properly-cased keys*/

	NSString *title = [attributes qs_objectForCaseInsensitiveKey:@"title"];
	if (QSStringIsEmpty(title)) {
		title = [attributes qs_objectForCaseInsensitiveKey:@"text"];
	}

	folder.title = title;

	return folder;
}


#pragma mark - Debugging

- (NSString *)description {

	NSString *s = [super description];
	return  [NSString stringWithFormat:@"%@ - %@", s, self.title];
}


- (NSDictionary *)dictionaryRepresentation {

	NSMutableDictionary *d = [NSMutableDictionary new];

	[d qs_safeSetObject:self.title forKey:@"title"];

	return d;
}


@end
