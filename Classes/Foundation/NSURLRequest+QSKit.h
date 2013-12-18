//
//  NSURLRequest+QSKit.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import Foundation;


@interface NSURLRequest (QSKit)


- (NSURL *)qs_loadingURL; /*Experimental. Returns nil if scheme isn't http or https (about:blank, for instance).*/

@end
