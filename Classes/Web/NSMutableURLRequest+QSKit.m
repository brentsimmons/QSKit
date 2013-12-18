//
//  NSMutableURLRequest+QSKit.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 11/6/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "NSMutableURLRequest+QSKit.h"
#import "QSHTTPConstants.h"


@implementation NSMutableURLRequest (QSKit)


- (void)qs_addBasicAuthorization:(NSString *)username password:(NSString *)password {

	NSString *s = [NSString stringWithFormat:@"%@:%@", username, password];
	NSData *d = [s dataUsingEncoding:NSUTF8StringEncoding];
	NSString *base64EncodedString = [d base64EncodedStringWithOptions:0];

	NSString *authorization = [NSString stringWithFormat:@"Basic %@", base64EncodedString];
	[self setValue:authorization forHTTPHeaderField:QSHTTPRequestHeaderAuthorization];
}


@end
