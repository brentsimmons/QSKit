//
//  NSString+QSKit.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/22/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import Foundation;


BOOL QSStringIsEmpty(NSString *s); /*Yes if null, NSNull, or length < 1*/

BOOL QSEqualStrings(NSString *s1, NSString *s2); /*Equal if both are nil*/

NSString *QSStringReplaceAll(NSString *stringToSearch, NSString *searchFor, NSString *replaceWith); /*Literal search*/


@interface NSString (QSKit)


/*The hashed data is a UTF-8 encoded version of the string.*/

- (NSData *)qs_md5Hash;
- (NSString *)qs_md5HashString;


/*Trims whitespace from leading and trailing ends. Collapses internal whitespace to single @" " character.
 Whitespace is space, tag, cr, and lf characters.*/

- (NSString *)qs_stringWithCollapsedWhitespace;

- (NSString *)qs_stringByTrimmingWhitespace;


/*0.0f to 1.0f for each.*/

typedef struct {
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat alpha;
} QSRGBAComponents;

/*red, green, blue components default to 1.0 if not specified.
 alpha defaults to 1.0 if not specified.*/

- (QSRGBAComponents)qs_rgbaComponents;


/*If string doesn't have the prefix, it returns self. If prefix is nil or empty, returns self. If self and prefix are equal, returns @"".*/

- (NSString *)qs_stringByStrippingPrefix:(NSString *)prefix caseSensitive:(BOOL)caseSensitive;


@end
