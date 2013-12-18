//
//  NSMutableDictionary+QSKit.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "NSMutableDictionary+QSKit.h"


@implementation NSMutableDictionary (QSKit)


- (void)qs_safeSetObject:(id)obj forKey:(id)key {
	if (obj != nil & key != nil) {
		[self setObject:obj forKey:key];
	}
}


@end
