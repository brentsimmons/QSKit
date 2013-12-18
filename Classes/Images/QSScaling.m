//
//  QSScaling.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "QSScaling.h"
#import "QSMath.h"


static CGFloat QSScaleFactorToFillSize(CGSize imageSize, CGSize constrainingSize) {

    if (CGSizeEqualToSize(imageSize, constrainingSize))
        return 1.0f;

    CGFloat scaleFactorHeight = imageSize.height / constrainingSize.height;
    CGFloat scaleFactorWidth = imageSize.width / constrainingSize.width;
    CGFloat scaleFactor = MIN(scaleFactorHeight, scaleFactorWidth);

    return scaleFactor;
}


static CGFloat QSScaleFactorToFitSize(CGSize imageSize, CGSize constrainingSize) {

	if (CGSizeEqualToSize(imageSize, constrainingSize))
        return 1.0f;

    CGFloat scaleFactorHeight = imageSize.height / constrainingSize.height;
    CGFloat scaleFactorWidth = imageSize.width / constrainingSize.width;
    CGFloat scaleFactor = MAX(scaleFactorHeight, scaleFactorWidth);

    return scaleFactor;
}


CGFloat QSZoomScaleToFillSize(CGSize imageSize, CGSize constrainingSize) {
	
    CGFloat scaleFactor = QSScaleFactorToFillSize(imageSize, constrainingSize);
    return 1.0f / scaleFactor;
}


CGFloat QSZoomScaleToFitSize(CGSize imageSize, CGSize constrainingSize) {

    CGFloat scaleFactor = QSScaleFactorToFitSize(imageSize, constrainingSize);
    return 1.0f / scaleFactor;
}


CGSize QSScaledSizeForImageFittingSize(CGSize imageSize, CGSize constrainingSize) {

    CGFloat scaleFactor = QSScaleFactorToFitSize(imageSize, constrainingSize);
    CGSize scaledSize = CGSizeZero;

    scaledSize.height = QSCeil(imageSize.height / scaleFactor);
    scaledSize.width = QSCeil(imageSize.width / scaleFactor);

    return scaledSize;
}
