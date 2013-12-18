//
//  QSOPMLParserFeedsOnly.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 11/1/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import Foundation;


/*Parses OPML but gets just the feeds. Puts them into a flat array.*/

@interface QSOPMLParserFeedsOnly : NSObject


- (void)parseOPMLData:(NSData *)data;
- (void)finishParsing;

@property (nonatomic, readonly) NSArray *feeds; /*QSOPMLFeed objects.*/


@end
