//
//  NSArray+QSKit.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import Foundation;


@interface NSArray (QSKit)


/*Returns nil if out of bounds instead of throwing an exception.*/

- (id)qs_safeObjectAtIndex:(NSUInteger)anIndex;


@end
