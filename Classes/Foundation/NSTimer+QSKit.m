//
//  NSTimer+QSKit.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 11/1/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "NSTimer+QSKit.h"


@implementation NSTimer (QSKit)


- (void)qs_invalidateIfValid {
	
	if ([self isValid]) {
		[self invalidate];
	}
}

@end
