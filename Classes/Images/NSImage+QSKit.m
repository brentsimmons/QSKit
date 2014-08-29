//
//  NSImage+QSKit.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/30/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


#if !TARGET_OS_IPHONE


#import "NSImage+QSKit.h"


@implementation NSImage (QSKit)


+ (void)qs_imageWithData:(NSData *)data imageResultBlock:(QSImageResultBlock)imageResultBlock {

	NSParameterAssert(data != nil);
    NSParameterAssert(imageResultBlock != nil);

 	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        imageResultBlock([[NSImage alloc] initWithData:data]);
	});
}


@end


#endif
