//
//  NSString+QSKit.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/22/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "NSString+QSKit.h"
#import "NSData+QSKit.h"
#import "NSMutableArray+QSKit.h"


BOOL QSStringIsEmpty(NSString *s) {

	if (s == nil || (id)s == [NSNull null]) {
		return YES;
	}
	
	return [s length] < 1;
}


BOOL QSEqualStrings(NSString *s1, NSString *s2) {

	return (s1 == nil && s2 == nil) || [s1 isEqualToString:s2];
}


NSString *QSStringReplaceAll(NSString *stringToSearch, NSString *searchFor, NSString *replaceWith) {

	if (QSStringIsEmpty(stringToSearch)) {
		return stringToSearch;
	}
	if (searchFor == nil || replaceWith == nil) {
		return stringToSearch;
	}

	NSMutableString *s = [stringToSearch mutableCopy];
	[s replaceOccurrencesOfString:searchFor withString:replaceWith options:NSLiteralSearch range:NSMakeRange(0, [s length])];

	return s;
}


@implementation NSString (QSKit)


- (NSData *)qs_md5Hash {

	NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
	return [data qs_md5Hash];
}


- (NSString *)qs_md5HashString {

	NSData *d = [self qs_md5Hash];
	return [d qs_hexadecimalString];
}


- (NSString *)qs_stringWithCollapsedWhitespace {

	NSMutableString *dest = [self mutableCopy];

	CFStringTrimWhitespace((__bridge CFMutableStringRef)dest);

	[dest replaceOccurrencesOfString:@"\t" withString:@" " options:NSLiteralSearch range:NSMakeRange(0, [dest length])];
	[dest replaceOccurrencesOfString:@"\r" withString:@" " options:NSLiteralSearch range:NSMakeRange(0, [dest length])];
	[dest replaceOccurrencesOfString:@"\n" withString:@" " options:NSLiteralSearch range:NSMakeRange(0, [dest length])];

	while ([dest rangeOfString:@"  " options:0].location != NSNotFound) {
		[dest replaceOccurrencesOfString:@"  " withString:@" " options:NSLiteralSearch range:NSMakeRange(0, [dest length])];
	}

	return dest;
}


- (NSString *)qs_stringByTrimmingWhitespace {

	NSMutableString *dest = [self mutableCopy];
 	CFStringTrimWhitespace((__bridge CFMutableStringRef)dest);

    return [dest copy];
}


- (QSRGBAComponents)qs_rgbaComponents {

	QSRGBAComponents components = {0.0f, 0.0f, 0.0f, 1.0f};

	NSMutableString *s = [self mutableCopy];
	[s replaceOccurrencesOfString:@"#" withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [s length])];
	CFStringTrimWhitespace((__bridge CFMutableStringRef)s);

	unsigned int red = 0, green = 0, blue = 0, alpha = 0;

	if ([s length] >= 2) {
		if ([[NSScanner scannerWithString:[s substringWithRange:NSMakeRange(0, 2)]] scanHexInt:&red]) {
			components.red = (CGFloat)red / 255.0f;
		}
	}

	if ([s length] >= 4) {
		if ([[NSScanner scannerWithString:[s substringWithRange:NSMakeRange(2, 2)]] scanHexInt:&green]) {
			components.green = (CGFloat)green / 255.0f;
		}
	}

	if ([s length] >= 6) {
		if ([[NSScanner scannerWithString:[s substringWithRange:NSMakeRange(4, 2)]] scanHexInt:&blue]) {
			components.blue = (CGFloat)blue / 255.0f;
		}
	}

	if ([s length] >= 8) {
		if ([[NSScanner scannerWithString:[s substringWithRange:NSMakeRange(6, 2)]] scanHexInt:&alpha]) {
			components.alpha = (CGFloat)alpha / 255.0f;
		}
	}

	return components;
}


- (NSString *)qs_stringByStrippingPrefix:(NSString *)prefix caseSensitive:(BOOL)caseSensitive {

	if (QSStringIsEmpty(prefix)) {
		return self;
	}
	
    if (!caseSensitive) {
        if (![[self lowercaseString] hasPrefix:[prefix lowercaseString]])
            return self;
    }
    else if (![self hasPrefix:prefix]) {
        return self;
	}

    if ([self isEqualToString:prefix]) {
        return @"";
	}
    if (!caseSensitive && [self caseInsensitiveCompare:prefix] == NSOrderedSame) {
        return @"";
	}

    return [self substringFromIndex:[prefix length]];
}


- (NSArray *)qs_links {

	if ([self length] < 1)
		return nil;

	/*The regex pattern is from John Gruber.*/

	static dispatch_once_t pred;
	static NSRegularExpression *regex = nil;

	dispatch_once(&pred, ^{
		NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Liberal-URL-Regex-Pattern" ofType:@""];
		NSError *error = nil;
		NSString *pattern = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
		error = nil;
		regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
	});

	NSAssert(regex != nil, @"The regular expression for qs_links was not loaded.");

	NSMutableArray *links = [NSMutableArray new];

	@autoreleasepool {

		NSArray *matches = [regex matchesInString:self options:0 range:NSMakeRange(0, [self length])];
		for (NSTextCheckingResult *oneResult in matches) {
			NSRange oneRange = [oneResult rangeAtIndex:1];
			NSString *oneLink = [self substringWithRange:oneRange];
			[links qs_safeAddObject:oneLink];
		}
	}

	return links;
}

@end
