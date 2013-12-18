//
//  QSOPMLFeed.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 11/1/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import Foundation;


@interface QSOPMLFeed : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *URL;
@property (nonatomic) NSString *feedURL;


+ (instancetype)OPMLFeedWithXMLAttributes:(NSDictionary *)attributes;


@end
