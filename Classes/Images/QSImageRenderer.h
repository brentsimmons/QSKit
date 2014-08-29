//
//  QSImageRenderer.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/23/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import Foundation;
#import "QSPlatform.h"
#import "QSBlocks.h"


/*Used to render an image based on another image. (Thumbnails, for instance.)
 Thread-safe. Renders in a background queue.
 
 imageRenderBlock is responsible for dealing with graphics context; it returns the rendered image.
 
 imageResultBlock may be called on any thread.
 
 None of the parameters may be nil.
 */


@interface QSImageRenderer : NSObject

- (instancetype)initWithRenderer:(QSImageRenderBlock)imageRenderBlock;

- (void)renderImage:(QS_IMAGE *)originalImage imageResultBlock:(QSImageResultBlock)imageResultBlock;

@end
