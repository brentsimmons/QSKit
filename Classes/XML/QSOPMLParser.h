//
//  QSOPMLParser.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 11/1/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import Foundation;


/*Creates a tree of QSNode. The representedObject for each node is either QSOPMLFolder or QSOPMLFeed.*/

@class QSNode;


@interface QSOPMLParser : NSObject

- (void)parseOPMLData:(NSData *)data;
- (void)finishParsing;

@property (nonatomic, readonly) QSNode *rootNode;

@end
