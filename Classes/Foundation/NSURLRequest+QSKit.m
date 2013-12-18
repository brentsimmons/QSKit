//
//  NSURLRequest+QSKit.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "NSURLRequest+QSKit.h"
#import "NSURL+QSKit.h"
#import "NSString+QSKit.h"


@implementation NSURLRequest (QSKit)


- (NSURL *)qs_loadingURL {

    NSURL *loadingURL = [self mainDocumentURL];
	if (loadingURL == nil || ![loadingURL qs_isHTTPOrHTTPSURL]) {
		return nil;
	}

    NSString *absoluteString = [loadingURL absoluteString];
	if (QSStringIsEmpty(absoluteString)) {
		return nil;
	}

    return loadingURL;
}


@end
