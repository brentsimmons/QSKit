//
//  NSData+QSKit.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/25/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "NSData+QSKit.h"


@implementation NSData (QSKit)


- (NSData *)qs_md5Hash {

	unsigned char hash[CC_MD5_DIGEST_LENGTH];
	CC_MD5([self bytes], (CC_LONG)[self length], hash);
	
	return [NSData dataWithBytes:(const void *)hash length:CC_MD5_DIGEST_LENGTH];
}


BOOL QSEqualBytes(const void *bytes1, const void *bytes2, size_t length) {

	return memcmp(bytes1, bytes2, length) == 0;
}


- (BOOL)qs_dataBeginsWithBytes:(const void *)bytes length:(size_t)numberOfBytes {

	if ([self length] < numberOfBytes) {
		return NO;
	}
	
	return QSEqualBytes([self bytes], bytes, numberOfBytes);
}


- (BOOL)qs_dataIsPNG {

	/* http://www.w3.org/TR/PNG/#5PNG-file-signature : "The first eight bytes of a PNG datastream always contain the following (decimal) values: 137 80 78 71 13 10 26 10" */

	static const Byte pngHeader[] = {137, 'P', 'N', 'G', 13, 10, 26, 10};
	return [self qs_dataBeginsWithBytes:pngHeader length:sizeof(pngHeader)];
}


- (BOOL)qs_dataIsGIF {

	/* http://www.onicos.com/staff/iz/formats/gif.html */

	static const Byte gifHeader1[] = {'G', 'I', 'F', '8', '7', 'a'};
	if ([self qs_dataBeginsWithBytes:gifHeader1 length:sizeof(gifHeader1)]) {
		return YES;
	}

	static const Byte gifHeader2[] = {'G', 'I', 'F', '8', '9', 'a'};
	return [self qs_dataBeginsWithBytes:gifHeader2 length:sizeof(gifHeader2)];
}


- (BOOL)qs_dataIsJPEG {

	const void *bytes = [self bytes];

	static const Byte jpegHeader1[] = {'J', 'F', 'I', 'F'};

	if (QSEqualBytes(bytes + 6, jpegHeader1, sizeof(jpegHeader1))) {
		return YES;
	}

	static const Byte jpegHeader2[] = {'E', 'x', 'i', 'f'};
	return QSEqualBytes(bytes + 6, jpegHeader2, sizeof(jpegHeader2));
}


NSString *QSHexadecimalStringWithBytes(const Byte *bytes, NSUInteger numberOfBytes) {

	if (numberOfBytes < 1) {
		return nil;
	}

	NSMutableString *s = [[NSMutableString alloc] initWithString:@""];
	NSUInteger i = 0;

	for (i = 0; i < numberOfBytes; i++) {
		[s appendString:[NSString stringWithFormat:@"%02x", bytes[i]]];
	}

	return [s copy];
}


- (NSString *)qs_hexadecimalString {

	return QSHexadecimalStringWithBytes([self bytes], [self length]);
}


@end
