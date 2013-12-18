//
//  UIImage+QSKit.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/23/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "UIImage+QSKit.h"


@implementation UIImage (QSKit)


+ (void)qs_imageWithData:(NSData *)data imageResultBlock:(QSImageResultBlock)imageResultBlock {

	NSParameterAssert(data != nil);
	NSParameterAssert(imageResultBlock != nil);

	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
		imageResultBlock([UIImage imageWithData:data]);
	});
}


- (UIImage *)qs_imageTintedWithColor:(UIColor *)color {

	CGRect r = CGRectZero;
	r.size = self.size;

	UIImage *renderedImage = nil;
	CGFloat scale = [UIScreen mainScreen].scale;
	UIGraphicsBeginImageContextWithOptions(self.size, NO, scale);

	CGContextRef context = UIGraphicsGetCurrentContext();

	CGContextTranslateCTM(context, 0.0f, r.origin.y);
	CGContextScaleCTM(context, 1.0f, -1.0f);
	CGContextTranslateCTM(context, 0.0f, -(r.origin.y + r.size.height));

	[color set];
	UIRectFill(r);
	CGContextSetBlendMode(context, kCGBlendModeDestinationIn);
	CGContextDrawImage(context, r, self.CGImage);

	renderedImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();

	return renderedImage;
}


+ (UIImage *)qs_imageNamed:(NSString *)imageName tintedWithColor:(UIColor *)color {

    return [[self imageNamed:imageName] qs_imageTintedWithColor:color];
}


@end
