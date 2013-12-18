//
//  NSObject+QSKit.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/20/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "NSObject+QSKit.h"


BOOL QSIsEmpty(id obj) {

	if (obj == nil || (id)obj == [NSNull null]) {
		return YES;
	}

	if ([obj respondsToSelector:@selector(count)]) {
		return [obj count] < 1;
	}

	if ([obj respondsToSelector:@selector(length)]) {
		return [obj length] < 1;
	}

	return NO; /*Shouldn't get here very often.*/
}


@implementation NSObject (QSKit)

- (void)qs_performSelectorCoalesced:(SEL)selector withObject:(id)obj afterDelay:(NSTimeInterval)delay {

	[NSObject cancelPreviousPerformRequestsWithTarget:self selector:selector object:obj];
	[self performSelector:selector withObject:obj afterDelay:delay];
}


@end

