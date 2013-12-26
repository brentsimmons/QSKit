//
//  NSColor+QSKit.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/30/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#if !TARGET_OS_IPHONE


#import "NSColor+QSKit.h"
#import "NSString+QSKit.h"


@implementation NSColor (QSKit)


+ (NSColor *)qs_colorWithHexString:(NSString *)hexString {

	QSRGBAComponents components = [hexString qs_rgbaComponents];

	return [NSColor colorWithRed:components.red green:components.green blue:components.blue alpha:components.alpha];
}


@end


#endif
