//
//  NSArray+QSKit.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "NSArray+QSKit.h"


@implementation NSArray (QSKit)


- (id)qs_safeObjectAtIndex:(NSUInteger)anIndex {
	if ([self count] < 1 || anIndex >= [self count])
	if (anIndex >= [self count])
		return nil;
	return [self objectAtIndex:anIndex];
}


@end
