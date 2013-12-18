//
//  NSDate+QSKit.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/25/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import <libkern/OSAtomic.h>
#import "NSDate+QSKit.h"


@implementation NSDate (QSKit)


- (NSString *)qs_unixTimestampStringWithNoDecimal {
	return [NSString stringWithFormat:@"%.0f", [self timeIntervalSince1970]]; /*%.0f means no decimal*/
}


static OSSpinLock iso8601DateFormatterLock = OS_SPINLOCK_INIT;

- (NSString *)qs_iso8601DateString {

	/*NSDateFormatters are not thread-safe.*/

	OSSpinLockLock(&iso8601DateFormatterLock);

	static NSDateFormatter *dateFormatter = nil;

	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		dateFormatter = [NSDateFormatter new];
		NSLocale *enUSPOSIXLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
		[dateFormatter setLocale:enUSPOSIXLocale];
		[dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"];
	});

	NSString *dateString = [dateFormatter stringFromDate:self];

	OSSpinLockUnlock(&iso8601DateFormatterLock);

	return dateString;
}


+ (NSDate *)qs_dateWithNumberOfDaysInThePast:(NSUInteger)numberOfDays {

	NSTimeInterval timeInterval = 60 * 60 * 24 * numberOfDays;
	return [NSDate dateWithTimeIntervalSinceNow:-timeInterval];
}


@end
