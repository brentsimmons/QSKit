//
//  QSMath.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "QSMath.h"


CGFloat QSCeil(CGFloat f) {

	#if __LP64__
		return ceil(f);
	#else
		return ceilf(f);
	#endif
}

CGFloat QSAbs(CGFloat f) {

	#if __LP64__
		return fabs(f);
	#else
		return fabsf(f);
	#endif
}


CGFloat QSFloor(CGFloat f) {

	#if __LP64__
		return floor(f);
	#else
		return floorf(f);
	#endif
}

