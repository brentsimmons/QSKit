//
//  UIResponder+QSKit.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


#import "UIResponder+QSKit.h"


@implementation UIResponder (QSKit)


- (BOOL)qs_performSelectorViaResponderChain:(SEL)aSelector withObject:(id)anObject {
	UIResponder *nomad = self;
	while (nomad != nil) {
		if ([nomad respondsToSelector:aSelector]) {

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
			[nomad performSelector:aSelector withObject:anObject];
#pragma clang diagnostic pop

			return YES;
		}
		nomad = [nomad nextResponder];
	}
	return NO;
}


@end
