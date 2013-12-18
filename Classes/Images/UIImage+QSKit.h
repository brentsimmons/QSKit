//
//  UIImage+QSKit.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/23/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import UIKit;
#import "QSBlocks.h"


@interface UIImage (QSKit)


/*Calls +imageWithData: in background queue. data and imageResultBlock must be non-nil.*/

+ (void)qs_imageWithData:(NSData *)data imageResultBlock:(QSImageResultBlock)imageResultBlock;


- (UIImage *)qs_imageTintedWithColor:(UIColor *)color;
+ (UIImage *)qs_imageNamed:(NSString *)imageName tintedWithColor:(UIColor *)color;


@end
