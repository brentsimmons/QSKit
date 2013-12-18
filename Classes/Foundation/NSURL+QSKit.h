//
//  NSURL+QSKit.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import Foundation;


@interface NSURL (QSKit)


- (BOOL)qs_isHTTPSURL;
- (BOOL)qs_isHTTPURL;
- (BOOL)qs_isHTTPOrHTTPSURL;

- (NSString *)qs_absoluteStringWithHTTPOrHTTPSPrefixRemoved; /*Case-insensitive. Removes http:// or https://.*/


/*Turns dictionary into ?x=y&a=b and appends it to URL.
 If the URL already has a query, and queryDictionary is not empty,
 the original query will be replaced.
 
 The query keys are sorted (case-insensitive).*/

- (NSURL *)qs_URLByAppendingQueryDictionary:(NSDictionary *)queryDictionary;


@end
