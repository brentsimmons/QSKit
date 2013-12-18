//
//  NSNotificationCenter+QSKit.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/20/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "NSNotificationCenter+QSKit.h"


@implementation NSNotificationCenter (QSKit)

- (void)qs_postNotificationNameOnMainThread:(NSString *)notificationName object:(id)obj userInfo:(NSDictionary *)userInfo {

	if (![NSThread isMainThread]) {

		dispatch_async(dispatch_get_main_queue(), ^{

			[self postNotificationName:notificationName object:obj userInfo:userInfo];
		});
	}

	else {
		[self postNotificationName:notificationName object:obj userInfo:userInfo];
	}
}

@end

