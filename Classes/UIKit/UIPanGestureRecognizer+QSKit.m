//
//  UIPanGestureRecognizer+QSKit.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/21/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "UIPanGestureRecognizer+QSKit.h"
#import "QSConstants.h"
#import "QSMath.h"


@implementation UIPanGestureRecognizer (QSKit)


- (UIRectEdge)qs_leftOrRightDirectionInView:(UIView *)view commitThreshold:(CGFloat)commitThreshold commitVelocity:(CGFloat)commitVelocity {

	CGPoint translation = [self translationInView:view];
	CGFloat originX = translation.x;

	if (originX < commitThreshold) {
		return UIRectEdgeLeft;
	}

	CGFloat velocityX = [self velocityInView:view].x;
	BOOL velocityIsAboveCommitVelocity = QSAbs(velocityX) > commitVelocity;
	if (!velocityIsAboveCommitVelocity) {
		return UIRectEdgeRight;
	}

	if (velocityX < 0.0f) {
		return UIRectEdgeLeft;
	}
	
	return UIRectEdgeRight;
}


@end
