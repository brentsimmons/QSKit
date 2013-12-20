//
//  UIColor+QSKit.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "UIColor+QSKit.h"
#import "NSString+QSKit.h"


@implementation UIColor (QSKit)


+ (UIColor *)qs_colorWithHexString:(NSString *)hexString {

	QSRGBAComponents components = [hexString qs_rgbaComponents];

	return [UIColor colorWithRed:components.red green:components.green blue:components.blue alpha:components.alpha];
}


@end
