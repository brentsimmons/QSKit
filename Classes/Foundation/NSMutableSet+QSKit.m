//
//  NSMutableSet+QSKit.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/25/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "NSMutableSet+QSKit.h"


@implementation NSMutableSet (QSKit)


- (void)qs_safeAddObject:(id)obj {
	if (obj != nil) {
		[self addObject:obj];
	}
}


@end
