//
//  QSImageRenderer.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/23/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "QSImageRenderer.h"


static void QSImageRender(QS_IMAGE *originalImage, QSImageRenderBlock renderer, QSImageResultBlock imageCallback) {

	assert(originalImage != nil);
	assert(renderer != nil);
	assert(imageCallback != nil);
	
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{

		@autoreleasepool {

			QS_IMAGE *renderedImage = renderer(originalImage);
			imageCallback(renderedImage);
		}
	});
}



@interface QSImageRenderer ()

@property (nonatomic, copy) QSImageRenderBlock imageRenderBlock;

@end



@implementation QSImageRenderer


#pragma mark - Init

- (instancetype)initWithRenderer:(QSImageRenderBlock)imageRenderBlock {

	NSParameterAssert(imageRenderBlock != nil);
	
	self = [super init];
	if (self == nil) {
		return nil;
	}

	_imageRenderBlock = imageRenderBlock;

	return self;
}


#pragma mark - API

- (void)renderImage:(QS_IMAGE *)originalImage imageResultBlock:(QSImageResultBlock)imageResultBlock {

	NSParameterAssert(originalImage != nil);
	NSParameterAssert(imageResultBlock != nil);

	QSImageRender(originalImage, self.imageRenderBlock, imageResultBlock);
}


@end

