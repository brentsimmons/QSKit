//
//  QSDatabaseQueue.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/19/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

@import Foundation;

@class FMDatabase;


/*Thread-safe. Creates database in Documents folder (iOS) or Application Support folder (Mac).
 
 update, fetch, and vacuum are async.
 updateBlock and fetchBlock run on a background serial queue.
 update and fetch both have autoreleasepools.*/


typedef void (^QSDatabaseBlock)(FMDatabase *database);


@interface QSDatabaseQueue : NSObject


- (instancetype)initWithFilename:(NSString *)filename excludeFromBackup:(BOOL)excludeFromBackup;

- (void)update:(QSDatabaseBlock)updateBlock; /*Wrapped in a transaction.*/

- (void)fetch:(QSDatabaseBlock)fetchBlock;

- (void)vacuum;


@end
