//
//  UIPanGestureRecognizer+QSKit.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/21/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import UIKit;


@interface UIPanGestureRecognizer (QSKit)

- (UIRectEdge)qs_leftOrRightDirectionInView:(UIView *)view commitThreshold:(CGFloat)commitThreshold commitVelocity:(CGFloat)commitVelocity;

@end
