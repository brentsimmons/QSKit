//
//  NSDataTests.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSData+QSKit.h"


@interface NSDataTests : XCTestCase
@end


@implementation NSDataTests


- (void)testQSMD5Hash {

	NSString *s = @"Walked the sand with the crustaceans";
	NSData *d = [s dataUsingEncoding:NSUTF8StringEncoding];
	NSData *hashData = [d qs_md5Hash];

	static const unsigned char expectedHashData[] = {0x61, 0x2c, 0x8f, 0x45, 0x62, 0xf9, 0xe9, 0xc5, 0xb4, 0xca, 0x9c, 0x83, 0x69, 0xfa, 0xb5, 0x9e};

	XCTAssertEqual((size_t)[hashData length], sizeof(expectedHashData));
	OSStatus result = memcmp([hashData bytes], expectedHashData, sizeof(expectedHashData));
	XCTAssertEqual(result, (OSStatus)0);
}


- (void)testQSHexadecimalString {

	static const Byte bytes[] = {0xde, 0xad, 0xbe, 0xef};

	NSData *data = [NSData dataWithBytes:bytes length:sizeof(bytes)];
	NSString *hexString = [data qs_hexadecimalString];
	XCTAssertEqualObjects(hexString, @"deadbeef");

	static const Byte bytes2[] = {0x10, 0x20, 0x30, 0x40, 0x99, 0xff, 0x00, 0x42};

	data = [NSData dataWithBytes:bytes2 length:sizeof(bytes2)];
	hexString = [data qs_hexadecimalString];
	XCTAssertEqualObjects(hexString, @"1020304099ff0042");

	NSString *f = [[NSBundle bundleForClass:[self class]] pathForResource:@"appstore" ofType:@"png"];
	NSData *d = [NSData dataWithContentsOfFile:f];
	hexString = [d qs_hexadecimalString];
	XCTAssertTrue([hexString hasPrefix:@"89504e47"]);
	XCTAssertTrue([hexString length] == ([d length] * 2));
}


- (void)testQSDataBeginsWithBytes {

	static const UInt64 bytes[] = {0xde, 0xad, 0xbe, 0xef, 0x46};
	NSData *d = [NSData dataWithBytes:bytes length:sizeof(bytes)];

	static const UInt64 prefixBytes[] = {0xde, 0xad};
	XCTAssertTrue([d qs_dataBeginsWithBytes:prefixBytes length:sizeof(prefixBytes)]);

	static const UInt64 bogusPrefixBytes[] = {0xde, 0x99};
	XCTAssertFalse([d qs_dataBeginsWithBytes:bogusPrefixBytes length:sizeof(bogusPrefixBytes)]);

	static const Byte bogusPrefixBytes2[] = {0xde, 0xad, 0xbe, 0xef, 0x46};
	XCTAssertFalse([d qs_dataBeginsWithBytes:bogusPrefixBytes2 length:sizeof(bogusPrefixBytes2)]);
}


- (void)testQSEqualBytes {

	static const Byte bytes1[] = {0xde, 0xad, 0xbe, 0xef, 0x46};
	static const Byte bytes2[] = {0xde, 0xad, 0xbe, 0xef, 0xff};
	XCTAssertTrue(QSEqualBytes(bytes1, bytes2, sizeof(bytes1) - sizeof(Byte)));
	XCTAssertFalse(QSEqualBytes(bytes1, bytes2, sizeof(bytes1)));

	static const unsigned int bytes3[] = {0xde, 0xad, 0xbe, 0xef, 0x46};
	static const unsigned int bytes4[] = {0xde, 0xad, 0xbe, 0xef, 0xff};
	XCTAssertTrue(QSEqualBytes(bytes3, bytes4, sizeof(bytes3) - sizeof(unsigned int)));
	XCTAssertFalse(QSEqualBytes(bytes3, bytes4, sizeof(bytes3)));

	static const UInt64 bytes5[] = {0xde, 0xad, 0xbe, 0xef, 0x46};
	static const UInt64 bytes6[] = {0xde, 0xad, 0xbe, 0xef, 0xff};
	XCTAssertTrue(QSEqualBytes(bytes5, bytes6, sizeof(bytes5) - sizeof(UInt64)));
	XCTAssertFalse(QSEqualBytes(bytes5, bytes6, sizeof(bytes5)));
}


- (void)testQSDataIsPNG {

	NSString *f = [[NSBundle bundleForClass:[self class]] pathForResource:@"appstore" ofType:@"png"];
	NSData *d = [NSData dataWithContentsOfFile:f];
	XCTAssertTrue([d qs_dataIsPNG]);

	f = [[NSBundle bundleForClass:[self class]] pathForResource:@"qbranch" ofType:@"png"];
	d = [NSData dataWithContentsOfFile:f];
	XCTAssertTrue([d qs_dataIsPNG]);

	f = [[NSBundle bundleForClass:[self class]] pathForResource:@"background" ofType:@"jpg"];
	d = [NSData dataWithContentsOfFile:f];
	XCTAssertFalse([d qs_dataIsPNG]);

	f = [[NSBundle bundleForClass:[self class]] pathForResource:@"test" ofType:@"gif"];
	d = [NSData dataWithContentsOfFile:f];
	XCTAssertFalse([d qs_dataIsPNG]);
}


- (void)testQSDataIsJPEG {

	NSString *f = [[NSBundle bundleForClass:[self class]] pathForResource:@"appstore" ofType:@"png"];
	NSData *d = [NSData dataWithContentsOfFile:f];
	XCTAssertFalse([d qs_dataIsJPEG]);

	f = [[NSBundle bundleForClass:[self class]] pathForResource:@"qbranch" ofType:@"png"];
	d = [NSData dataWithContentsOfFile:f];
	XCTAssertFalse([d qs_dataIsJPEG]);

	f = [[NSBundle bundleForClass:[self class]] pathForResource:@"background" ofType:@"jpg"];
	d = [NSData dataWithContentsOfFile:f];
	XCTAssertTrue([d qs_dataIsJPEG]);

	f = [[NSBundle bundleForClass:[self class]] pathForResource:@"test" ofType:@"gif"];
	d = [NSData dataWithContentsOfFile:f];
	XCTAssertFalse([d qs_dataIsJPEG]);
}


- (void)testQSDataIsGIF {

	NSString *f = [[NSBundle bundleForClass:[self class]] pathForResource:@"appstore" ofType:@"png"];
	NSData *d = [NSData dataWithContentsOfFile:f];
	XCTAssertFalse([d qs_dataIsGIF]);

	f = [[NSBundle bundleForClass:[self class]] pathForResource:@"qbranch" ofType:@"png"];
	d = [NSData dataWithContentsOfFile:f];
	XCTAssertFalse([d qs_dataIsGIF]);

	f = [[NSBundle bundleForClass:[self class]] pathForResource:@"background" ofType:@"jpg"];
	d = [NSData dataWithContentsOfFile:f];
	XCTAssertFalse([d qs_dataIsGIF]);

	f = [[NSBundle bundleForClass:[self class]] pathForResource:@"test" ofType:@"gif"];
	d = [NSData dataWithContentsOfFile:f];
	XCTAssertTrue([d qs_dataIsGIF]);
}


@end
