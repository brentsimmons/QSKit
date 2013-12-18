//
//  NSMutableURLRequest+QSKit.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 11/6/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import Foundation;


@interface NSMutableURLRequest (QSKit)


- (void)qs_addBasicAuthorization:(NSString *)username password:(NSString *)password; /*Do this only with https.*/


@end
