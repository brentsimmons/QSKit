//
//  QSBlocks.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/22/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

@import Foundation;
#import "QSPlatform.h"


typedef void (^QSVoidBlock)(void);

typedef QSVoidBlock QSVoidCompletionBlock;

typedef void (^QSFetchResultsBlock)(NSArray *fetchedObjects);

typedef void (^QSDataResultBlock)(NSData *d);

/*Images*/

typedef void (^QSImageResultBlock)(QS_IMAGE *image);

typedef QS_IMAGE *(^QSImageRenderBlock)(QS_IMAGE *imageToRender);

