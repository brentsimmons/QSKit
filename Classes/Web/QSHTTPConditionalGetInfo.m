//
//  QSHTTPConditionalGetInfo.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/28/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


#import "QSHTTPConditionalGetInfo.h"
#import "QSHTTPConstants.h"
#import "NSObject+QSKit.h"


@implementation QSHTTPConditionalGetInfo


+ (instancetype)conditionalGetInfoWithURLResponse:(NSHTTPURLResponse *)response {

	QSHTTPConditionalGetInfo *info = [self new];

	info.HTTPResponseLastModified = [response allHeaderFields][QSHTTPResponseHeaderLastModified];
	info.HTTPResponseETag = [response allHeaderFields][QSHTTPResponseHeaderEtag];

	return info;
}


- (void)addRequestHeadersToURLRequest:(NSMutableURLRequest *)URLRequest {

	if (!QSIsEmpty(self.HTTPResponseLastModified)) {
		[URLRequest addValue:self.HTTPResponseLastModified forHTTPHeaderField:QSHTTPRequestHeaderIfModifiedSince];
	}

	if (!QSIsEmpty(self.HTTPResponseETag)) {
		[URLRequest addValue:self.HTTPResponseETag forHTTPHeaderField:QSHTTPRequestHeaderIfNoneMatch];
	}
}

@end
