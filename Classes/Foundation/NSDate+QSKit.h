//
//  NSDate+QSKit.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/25/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import Foundation;


@interface NSDate (QSKit)


- (NSString *)qs_unixTimestampStringWithNoDecimal;

- (NSString *)qs_iso8601DateString;


/*Not intended for calendar-perfect use.*/

+ (NSDate *)qs_dateWithNumberOfDaysInThePast:(NSUInteger)numberOfDays;

@end
