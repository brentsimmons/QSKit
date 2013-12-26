//
//  NSAttributedString+QSKit.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import Foundation;
@import UIKit;
#import "QSPlatform.h"


@interface NSAttributedString (QSKit)


/*If kerning, adds NSKernAttributeName : [NSNull null] (which is the right way to turn on kerning, weirdly). Always Be Kerning.
 
 (Except that it breaks NSTextView's text pasteboard writing. So don't do it there.)*/

+ (NSAttributedString *)qs_attributedStringWithText:(NSString *)text font:(QS_FONT *)font color:(QS_COLOR *)color kerning:(BOOL)kerning;


@end
