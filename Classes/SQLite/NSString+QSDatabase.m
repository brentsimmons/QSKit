//
//  NSString+QSDatabase.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/23/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "NSString+QSDatabase.h"


@implementation NSString (QSDatabase)


+ (NSString *)qs_SQLValueListWithPlaceholders:(NSUInteger)numberOfValues {

	/*@"(?, ?, ?)"*/

	NSParameterAssert(numberOfValues > 0);
	if (numberOfValues < 1) {
		return nil;
	}

	NSMutableString *s = [[NSMutableString alloc] initWithString:@"("];
	NSUInteger i = 0;

	for (i = 0; i < numberOfValues; i++) {

		[s appendString:@"?"];
		BOOL isLast = (i == (numberOfValues - 1));
		if (!isLast) {
			[s appendString:@", "];
		}
	}

	[s appendString:@")"];
	
	return [s copy];
}

@end
