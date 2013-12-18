//
//  UIResponder+QSKit.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import UIKit;


@interface UIResponder (QSKit)


/*Returns YES if it found a responder to call.*/

- (BOOL)qs_performSelectorViaResponderChain:(SEL)aSelector withObject:(id)anObject;

@end
