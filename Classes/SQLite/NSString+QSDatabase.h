//
//  NSString+QSDatabase.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/23/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

@import Foundation;


@interface NSString (QSDatabase)


/*Returns @"(?, ?, ?)" -- where number of ? spots is specified by numberOfValues.
 numberOfValues should be greater than 0. Triggers an NSAssert if not.*/

+ (NSString *)qs_SQLValueListWithPlaceholders:(NSUInteger)numberOfValues;


@end
