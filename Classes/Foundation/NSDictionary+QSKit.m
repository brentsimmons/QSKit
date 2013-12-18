//
//  NSDictionary+QSKit.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 11/1/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "NSDictionary+QSKit.h"


@implementation NSDictionary (QSKit)


- (id)qs_objectForCaseInsensitiveKey:(NSString *)key {

	id obj = self[key];
	if (obj != nil) {
		return obj;
	}

	for (NSString *oneKey in [self allKeys]) {

		if ([oneKey isKindOfClass:[NSString class]] && [key caseInsensitiveCompare:oneKey] == NSOrderedSame) {
			return self[oneKey];
		}
	}

	return nil;
}


@end
