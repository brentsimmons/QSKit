//
//  QSHTTPCodes.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/25/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import Foundation;



typedef NS_ENUM(NSInteger, QSHTTPStatusCode) {

	/* http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html */

	QSHTTPStatusCodeContinue = 100,
    QSHTTPStatusCodeSwitchingProtocols = 101,

	QSHTTPStatusCodeOK = 200,
	QSHTTPStatusCodeCreated = 201,
	QSHTTPStatusCodeAccepted = 202,
	QSHTTPStatusCodeNonAuthoritativeInformation = 203,
	QSHTTPStatusCodeNoContent = 204,
	QSHTTPStatusCodeResetContent = 205,
	QSHTTPStatusCodePartialContent = 206,

	QSHTTPStatusCodeRedirectMultipleChoices = 300,
	QSHTTPStatusCodeRedirectPermanent = 301,
	QSHTTPStatusCodeRedirectTemporary = 302,
	QSHTTPStatusCodeRedirectSeeOther = 303,
	QSHTTPStatusCodeNotModified = 304,
	QSHTTPStatusCodeUseProxy = 305,
	QSHTTPStatusCodeUnused = 306,
	QSHTTPStatusCodeRedirectVeryTemporary = 307,

	QSHTTPStatusCodeBadRequest = 400,
	QSHTTPStatusCodeUnauthorized = 401,
	QSHTTPStatusCodePaymentRequired = 402,
	QSHTTPStatusCodeForbidden = 403,
	QSHTTPStatusCodeNotFound = 404,
	QSHTTPStatusCodeMethodNotAllowed = 405,
	QSHTTPStatusCodeNotAcceptable = 406,
	QSHTTPStatusCodeProxyAuthenticationRequired = 407,
	QSHTTPStatusCodeRequestTimeout = 408,
	QSHTTPStatusCodeConflict = 409,
	QSHTTPStatusCodeGone = 410,
	QSHTTPStatusCodeLengthRequired = 411,
	QSHTTPStatusCodePreconditionFailed = 412,
	QSHTTPStatusCodeRequestEntityTooLarge = 413,
	QSHTTPStatusCodeRequestURITooLong = 414,
	QSHTTPStatusCodeUnsupportedMediaType = 415,
	QSHTTPStatusCodeRequestedRangeNotSatisfiable = 416,
	QSHTTPStatusCodeExpectationFailed = 417,

	QSHTTPStatusCodeInternalServerError = 500,
	QSHTTPStatusCodeNotImplemented = 501,
	QSHTTPStatusCodeBadGateway = 502,
	QSHTTPStatusCodeServiceUnavailable = 503,
	QSHTTPStatusCodeGatewayTimeout = 504,
	QSHTTPStatusCodeHTTPVersionNotSupported = 505
};


/*Note especially the keys related to conditional GET. See:
 http://fishbowl.pastiche.org/2002/10/21/http_conditional_get_for_rss_hackers/ */

extern NSString *QSHTTPResponseHeaderLastModified; /*Conditional GET*/
extern NSString *QSHTTPResponseHeaderEtag; /*Conditional GET*/


extern NSString *QSHTTPRequestHeaderIfModifiedSince; /*Conditional GET*/
extern NSString *QSHTTPRequestHeaderIfNoneMatch; /*Conditional GET*/
extern NSString *QSHTTPRequestHeaderUserAgent;
extern NSString *QSHTTPRequestHeaderAuthorization;
extern NSString *QSHTTPRequestHeaderContentType;

extern NSString *QSPrefixHTTP; // @"http://"
extern NSString *QSPrefixHTTPS; // @"https://"

extern NSString *QSSchemeHTTP; // @"http"
extern NSString *QSSchemeHTTPS; // @"https"


extern NSString *QSHTTPMethodPost;
extern NSString *QSHTTPMethodGet;
extern NSString *QSHTTPMethodPut;
extern NSString *QSHTTPMethodDelete;

extern NSString *QSHTTPContentTypeJSON;

