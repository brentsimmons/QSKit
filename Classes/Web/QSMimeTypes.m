//
//  QSMimeTypes.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/25/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "QSMimeTypes.h"
#import "NSData+QSKit.h"


NSString *QSMimeTypePNG = @"image/png";
NSString *QSMimeTypeJPEG = @"image/jpeg";
NSString *QSMimeTypeGIF = @"image/gif";
NSString *QSMimeTypeTIFF = @"image/tiff";


NSString *QSMimeTypeForData(NSData *data) {

	if ([data qs_dataIsPNG]) {
		return QSMimeTypePNG;
	}

	if ([data qs_dataIsJPEG]) {
		return QSMimeTypeJPEG;
	}

	if ([data qs_dataIsGIF]) {
		return QSMimeTypeGIF;
	}

	return nil;
}


BOOL QSMimeTypeIsImage(NSString *mimeType) {

	NSString *lowerMimeType = [mimeType lowercaseString];

	return [lowerMimeType hasPrefix:@"image/"] || [lowerMimeType hasPrefix:@"x-image/"];
}


BOOL QSMimeTypeIsTimeBasedMedia(NSString *mimeType) {

	NSString *lowerMimeType = [mimeType lowercaseString];

	return [lowerMimeType hasPrefix:@"audio/"] || [lowerMimeType hasPrefix:@"x-audio/"] || [lowerMimeType hasPrefix:@"video/"] || [lowerMimeType hasPrefix:@"x-video/"];
}


BOOL QSMimeTypeIsMedia(NSString *mimeType) {

	return QSMimeTypeIsImage(mimeType) || QSMimeTypeIsTimeBasedMedia(mimeType);
}

