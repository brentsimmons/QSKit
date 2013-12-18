//
//  QSPlatform.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/23/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


#import "QSPlatform.h"


NSString *QSDataFolder(NSString *appName) {

#if TARGET_OS_IPHONE

    NSString *dataFolder = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];

#else

    NSString *dataFolder = [NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	if (appName == nil) {
		appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleExecutable"];
	}
	dataFolder = [dataFolder stringByAppendingPathComponent:appName];
	
#endif

	NSError *error = nil;
	
    if (![[NSFileManager defaultManager] createDirectoryAtPath:dataFolder withIntermediateDirectories:YES attributes:nil error:&error]) {
		NSLog(@"QSDataFolder error: %@", error);
		return nil;
    }

	return dataFolder;
}
