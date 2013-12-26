//
//  QSScaling.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import Foundation;
@import UIKit;


CGSize QSScaledSizeForImageFittingSize(CGSize imageSize, CGSize constrainingSize); /*does a ceil on size.*/

CGFloat QSZoomScaleToFitSize(CGSize imageSize, CGSize constrainingSize); /*Aspect fit*/
CGFloat QSZoomScaleToFillSize(CGSize imageSize, CGSize constrainingSize); /*Aspect fill*/
