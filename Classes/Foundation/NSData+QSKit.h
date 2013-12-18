//
//  NSData+QSKit.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/25/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

@import Foundation;


BOOL QSEqualBytes(const void *bytes1, const void *bytes2, size_t length);

NSString *QSHexadecimalStringWithBytes(const unsigned char *bytes, NSUInteger numberOfBytes);


@interface NSData (QSKit)


- (NSData *)qs_md5Hash;

- (BOOL)qs_dataIsPNG;
- (BOOL)qs_dataIsGIF;
- (BOOL)qs_dataIsJPEG;

- (BOOL)qs_dataBeginsWithBytes:(const void *)bytes length:(size_t)numberOfBytes;


/*If bytes are deadbeef, then string is @"deadbeef". Returns nil for empty data.*/
  
- (NSString *)qs_hexadecimalString;


@end
