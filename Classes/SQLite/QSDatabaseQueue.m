//
//  QSDatabaseQueue.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/19/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "FMDatabase.h"
#import "QSDatabaseQueue.h"
#import "QSPlatform.h"


@interface QSDatabaseQueue ()

@property (nonatomic, strong) NSString *databasePath;
@property (nonatomic, strong) dispatch_queue_t serialDispatchQueue;
@property (nonatomic, assign) BOOL excludeFromBackup;

@end


@implementation QSDatabaseQueue


#pragma mark - Init

- (instancetype)initWithFilename:(NSString *)filename excludeFromBackup:(BOOL)excludeFromBackup {

	self = [super init];
	if (self == nil)
		return self;

	NSString *dataFolder = QSDataFolder(nil);
	if (dataFolder == nil) {
		NSLog(@"Error creating data folder.");
		abort();
	}

	_databasePath = [dataFolder stringByAppendingPathComponent:filename];

	_serialDispatchQueue = dispatch_queue_create([[NSString stringWithFormat:@"QSDatabaseQueue serial queue - %@", filename] UTF8String], DISPATCH_QUEUE_SERIAL);

	_excludeFromBackup = excludeFromBackup;

	return self;
}


#pragma mark - Database

- (FMDatabase *)database {

	/*I've always done it this way -- kept a per-thread database in the threadDictionary -- and I know it's solid. Maybe it's not necessary with a serial queue, but my understanding was that SQLite wanted a different database per thread (and a serial queue may run on different threads).*/

	NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
	FMDatabase *database = threadDictionary[self.databasePath];

	if (database == nil) {

		database = [FMDatabase databaseWithPath:self.databasePath];
		[database open];
		[database executeUpdate:@"PRAGMA synchronous = 1;"];
		[database setShouldCacheStatements:YES];

		threadDictionary[self.databasePath] = database;

		if (self.excludeFromBackup) {

			static dispatch_once_t onceToken;
			dispatch_once(&onceToken, ^{
				NSURL *URL = [NSURL fileURLWithPath:self.databasePath isDirectory:NO];
				NSError *error = nil;
				[URL setResourceValue:@YES forKey:NSURLIsExcludedFromBackupKey error:&error];
			});
		}
	}

	return database;
}


#pragma mark - API

- (void)update:(QSDatabaseBlock)updateBlock {

	dispatch_async(self.serialDispatchQueue, ^{

		@autoreleasepool {
			FMDatabase *database = [self database];

			[database beginTransaction];

			updateBlock(database);

			[database commit];
		}
	});
}


- (void)fetch:(QSDatabaseBlock)fetchBlock {

	dispatch_async(self.serialDispatchQueue, ^{

		@autoreleasepool {
			FMDatabase *database = [self database];
			fetchBlock(database);
		}
	});
}


- (void)vacuum {

	dispatch_async(self.serialDispatchQueue, ^{

		@autoreleasepool {
			FMDatabase *database = [self database];
			[database executeUpdate:@"vacuum;"];
		}
	});
}


@end

