//
//  NSMutableArray+QSKit.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "NSMutableArray+QSKit.h"


@implementation NSMutableArray (QSKit)


- (void)qs_safeAddObject:(id)obj {
	if (obj != nil) {
		[self addObject:obj];
	}
}


@end
