//
//  NSNotificationCenter+QSKit.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/20/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

@import Foundation;


@interface NSNotificationCenter (QSKit)


/*Posts immediately if already on the main thread.*/

- (void)qs_postNotificationNameOnMainThread:(NSString *)notificationName object:(id)obj userInfo:(NSDictionary *)userInfo;

@end
