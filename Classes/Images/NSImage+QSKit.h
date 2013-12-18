//
//  NSImage+QSKit.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/30/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import Cocoa;
#import "QSBlocks.h"


@interface NSImage (QSKit)

/*Calls -initWithData in background queue. data and imageResultBlock must be non-nil.*/

+ (void)qs_imageWithData:(NSData *)data imageResultBlock:(QSImageResultBlock)imageResultBlock;


@end
