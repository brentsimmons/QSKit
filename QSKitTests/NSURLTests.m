//
//  NSURLTests.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 11/1/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSURL+QSKit.h"


@interface NSURLTests : XCTestCase
@end


@implementation NSURLTests


- (void)testQSIsHTTPURL {

	XCTAssertTrue([[NSURL URLWithString:@"http://apple.com/"] qs_isHTTPURL]);
	XCTAssertTrue([[NSURL URLWithString:@"HTTP://apple.com/"] qs_isHTTPURL]);
	XCTAssertTrue([[NSURL URLWithString:@"Http://apple.com/"] qs_isHTTPURL]);

	XCTAssertFalse([[NSURL URLWithString:@"https://apple.com/"] qs_isHTTPURL]);
	XCTAssertFalse([[NSURL URLWithString:@"about:blank"] qs_isHTTPURL]);
}


- (void)testQSIsHTTPSURL {

	XCTAssertTrue([[NSURL URLWithString:@"https://apple.com/"] qs_isHTTPSURL]);
	XCTAssertTrue([[NSURL URLWithString:@"HTTPs://apple.com/"] qs_isHTTPSURL]);
	XCTAssertTrue([[NSURL URLWithString:@"Https://apple.com/"] qs_isHTTPSURL]);

	XCTAssertFalse([[NSURL URLWithString:@"http://apple.com/"] qs_isHTTPSURL]);
	XCTAssertFalse([[NSURL URLWithString:@"about:blank"] qs_isHTTPSURL]);
}


- (void)testQSIsHTTPOrHTTPSURL {

	XCTAssertTrue([[NSURL URLWithString:@"http://apple.com/"] qs_isHTTPOrHTTPSURL]);
	XCTAssertTrue([[NSURL URLWithString:@"HTTP://apple.com/"] qs_isHTTPOrHTTPSURL]);
	XCTAssertTrue([[NSURL URLWithString:@"Http://apple.com/"] qs_isHTTPOrHTTPSURL]);
	XCTAssertTrue([[NSURL URLWithString:@"https://apple.com/"] qs_isHTTPOrHTTPSURL]);
	XCTAssertTrue([[NSURL URLWithString:@"HTTPs://apple.com/"] qs_isHTTPOrHTTPSURL]);
	XCTAssertTrue([[NSURL URLWithString:@"Https://apple.com/"] qs_isHTTPOrHTTPSURL]);

	XCTAssertFalse([[NSURL URLWithString:@"about:blank"] qs_isHTTPOrHTTPSURL]);
}


- (void)testQSAbsoluteStringWithHTTPOrHTTPSPrefixRemoved {

	XCTAssertEqualObjects([[NSURL URLWithString:@"http://apple.com/"] qs_absoluteStringWithHTTPOrHTTPSPrefixRemoved], @"apple.com/");
	XCTAssertEqualObjects([[NSURL URLWithString:@"https://apple.com/"] qs_absoluteStringWithHTTPOrHTTPSPrefixRemoved], @"apple.com/");
	XCTAssertEqualObjects([[NSURL URLWithString:@"about:blank"] qs_absoluteStringWithHTTPOrHTTPSPrefixRemoved], @"about:blank");

	XCTAssertEqualObjects([[NSURL URLWithString:@"Https://apple.com/foo/bar"] qs_absoluteStringWithHTTPOrHTTPSPrefixRemoved], @"apple.com/foo/bar");
	XCTAssertEqualObjects([[NSURL URLWithString:@"HTTP://apple.com/foo/bar"] qs_absoluteStringWithHTTPOrHTTPSPrefixRemoved], @"apple.com/foo/bar");

	XCTAssertEqualObjects([[NSURL URLWithString:@"HTTPX://apple.com/foo/bar"] qs_absoluteStringWithHTTPOrHTTPSPrefixRemoved], @"HTTPX://apple.com/foo/bar");
	XCTAssertEqualObjects([[NSURL URLWithString:@"https:/"] qs_absoluteStringWithHTTPOrHTTPSPrefixRemoved], @"https:/");
}


- (void)testQSURLByAppendingQueryDictionary {

	NSDictionary *d = @{@"foo" : @"bar"};
	NSURL *URL = [NSURL URLWithString:@"http://example.com/"];
	URL = [URL qs_URLByAppendingQueryDictionary:d];
	XCTAssertEqualObjects([URL absoluteString], @"http://example.com/?foo=bar");

	URL = [NSURL URLWithString:@"http://example.com/foo/bar"];
	URL = [URL qs_URLByAppendingQueryDictionary:d];
	XCTAssertEqualObjects([URL absoluteString], @"http://example.com/foo/bar?foo=bar");

	URL = [NSURL URLWithString:@"http://example.com/foo/bar?x=y"];
	URL = [URL qs_URLByAppendingQueryDictionary:d];
	XCTAssertEqualObjects([URL absoluteString], @"http://example.com/foo/bar?foo=bar");

	d = @{@"foo" : @"bar", @"a b c" : @"123"};
	URL = [NSURL URLWithString:@"http://example.com/foo/bar"];
	URL = [URL qs_URLByAppendingQueryDictionary:d];
	XCTAssertEqualObjects([URL absoluteString], @"http://example.com/foo/bar?a%20b%20c=123&foo=bar");

	d = @{@"foo" : @"bar", @"a b c" : @" 1 2 3 é"};
	URL = [NSURL URLWithString:@"http://example.com/foo/bar"];
	URL = [URL qs_URLByAppendingQueryDictionary:d];
	XCTAssertEqualObjects([URL absoluteString], @"http://example.com/foo/bar?a%20b%20c=%201%202%203%20%C3%A9&foo=bar");
}

@end
