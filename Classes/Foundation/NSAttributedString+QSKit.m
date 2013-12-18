//
//  NSAttributedString+QSKit.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "NSAttributedString+QSKit.h"


@implementation NSAttributedString (QSKit)


+ (NSAttributedString *)qs_attributedStringWithText:(NSString *)text font:(QS_FONT *)font color:(QS_COLOR *)color kerning:(BOOL)kerning {

	NSDictionary *attributes;

	if (kerning) {
		attributes = @{NSFontAttributeName : font, NSForegroundColorAttributeName : color, NSKernAttributeName : [NSNull null]};
	}
	else {
		attributes = @{NSFontAttributeName : font, NSForegroundColorAttributeName : color};
	}

	return [[self alloc] initWithString:text attributes:attributes];
}


@end
