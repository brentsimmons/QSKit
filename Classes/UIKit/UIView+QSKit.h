//
//  UIView+QSKit.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import UIKit;


@interface UIView (QSKit)


- (UIView *)qs_firstSubviewOfClass:(Class)aClass;

- (void)qs_setFrameIfNotEqual:(CGRect)rect;

- (void)qs_addParallaxMotionEffectWithOffset:(CGSize)offset;


@end
