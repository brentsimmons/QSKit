//
//  QSHTTPCodes.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/25/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "QSHTTPConstants.h"


NSString *QSHTTPResponseHeaderLastModified = @"Last-Modified";
NSString *QSHTTPResponseHeaderEtag = @"ETag";

NSString *QSHTTPRequestHeaderIfModifiedSince = @"If-Modified-Since";
NSString *QSHTTPRequestHeaderIfNoneMatch = @"If-None-Match";
NSString *QSHTTPRequestHeaderUserAgent = @"User-Agent";
NSString *QSHTTPRequestHeaderAuthorization = @"Authorization";
NSString *QSHTTPRequestHeaderContentType = @"Content-Type";

NSString *QSPrefixHTTP = @"http://";
NSString *QSPrefixHTTPS = @"https://";

NSString *QSSchemeHTTP = @"http";
NSString *QSSchemeHTTPS = @"https";

NSString *QSHTTPMethodPost = @"POST";
NSString *QSHTTPMethodGet = @"GET";
NSString *QSHTTPMethodPut = @"PUT";
NSString *QSHTTPMethodDelete = @"DELETE";

NSString *QSHTTPContentTypeJSON = @"application/json";

