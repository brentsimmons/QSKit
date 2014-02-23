//
//  QSMath.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import Foundation;


/*Does the right things with 32-bit/64-bit sizes.*/

/*PBS 23 Feb 2014: you should just use tgmath.h instead.
 I wrote these before I knew about it. These functions
 themselves now use tgmath.h.*/
 
CGFloat QSCeil(CGFloat f);
CGFloat QSFloor(CGFloat f);
CGFloat QSAbs(CGFloat f);

