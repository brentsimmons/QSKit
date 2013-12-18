//
//  QSAssets.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import Foundation;
@import UIKit;
#import "QSBlocks.h"


/*imageResultBlock will be called on main thread. Won't get called on error.*/

void QSAssetsMostRecentPhoto(QSImageResultBlock imageResultBlock);
