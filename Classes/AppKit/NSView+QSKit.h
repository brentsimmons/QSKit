//
//  NSView+QSKit.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/30/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


#if !TARGET_OS_IPHONE


@import Cocoa;


@interface NSView (QSKit)


/*Keeps subview at same size as receiver.*/

- (void)qs_addFullSizeConstraintsForSubview:(NSView *)view;


@end


#endif
