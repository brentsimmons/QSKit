//
//  QSHTTPConditionalGetInfo.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/28/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import Foundation;


/* http://fishbowl.pastiche.org/2002/10/21/http_conditional_get_for_rss_hackers/ */


@interface QSHTTPConditionalGetInfo : NSObject

@property (nonatomic, strong) NSString *HTTPResponseLastModified;
@property (nonatomic, strong) NSString *HTTPResponseETag;

+ (instancetype)conditionalGetInfoWithURLResponse:(NSHTTPURLResponse *)response;

- (void)addRequestHeadersToURLRequest:(NSMutableURLRequest *)URLRequest;

@end
