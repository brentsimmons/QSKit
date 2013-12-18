//
//  NSObject+QSKit.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/20/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import Foundation;


BOOL QSIsEmpty(id obj); /*YES if nil or NSNull -- or length or count < 1*/


@interface NSObject (QSKit)


/*Cancels any previous and does a new -performSelector:withObject:afterDelay:. Experimental.*/

- (void)qs_performSelectorCoalesced:(SEL)selector withObject:(id)obj afterDelay:(NSTimeInterval)delay;

@end
