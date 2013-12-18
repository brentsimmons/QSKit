//
//  QSDateParser.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 12/18/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

@import Foundation;

/*The problem: you often know that a date will be in 8601 format (for instance),
 but you don't know its precise format, so NSDateFormatter isn't helpful.
 
 Common web dates -- RFC 822 and 8601 -- are handled here:
 the formats you find in JSON and XML feeds.

 Any of these may return nil. They may also return garbage, given bad input.
*/
 

NSDate *QSDateWithString(NSString *dateString);

/*If you're using a SAX parser, you have the bytes  and don't need to convert to a string first.
 It's faster and uses less memory.
 (Assumes bytes are UTF-8 or ASCII. If you're using the libxml SAX parser, this will work.)*/

NSDate *QSDateWithBytes(const char *bytes, NSUInteger numberOfBytes);
