//
//  QSMimeTypes.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/25/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import Foundation;


extern NSString *QSMimeTypePNG; // image/png
extern NSString *QSMimeTypeJPEG; // image/jpeg
extern NSString *QSMimeTypeGIF; // image/gif
extern NSString *QSMimeTypeTIFF; // image/tiff

NSString *QSMimeTypeForData(NSData *data); /*Will usually return nil. Recognizes a few image types.*/

BOOL QSMimeTypeIsImage(NSString *mimeType);
BOOL QSMimeTypeIsTimeBasedMedia(NSString *mimeType);
BOOL QSMimeTypeIsMedia(NSString *mimeType); /*Is image or time-based media (audio or video)*/
