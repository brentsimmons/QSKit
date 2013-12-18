//
//  UIView+QSKit.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "UIView+QSKit.h"


@implementation UIView (QSKit)


- (UIView *)qs_firstSubviewOfClass:(Class)aClass {

	for (UIView *oneSubview in self.subviews) {

		if ([oneSubview isKindOfClass:aClass]) {
			return oneSubview;
		}
	}

	return nil;
}


- (void)qs_setFrameIfNotEqual:(CGRect)rect {
	if (!CGRectEqualToRect(rect, self.frame)) {
		self.frame = rect;
	}
}


- (void)qs_addParallaxMotionEffectWithOffset:(CGSize)offset {

	UIInterpolatingMotionEffect *horizontalParallaxEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];

	horizontalParallaxEffect.minimumRelativeValue = @(offset.width);
	horizontalParallaxEffect.maximumRelativeValue = @(-(offset.width));

	UIInterpolatingMotionEffect *verticalParallaxEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];

	verticalParallaxEffect.minimumRelativeValue = @(offset.height);
	verticalParallaxEffect.maximumRelativeValue = @(-(offset.height));

	UIMotionEffectGroup *effectGroup = [UIMotionEffectGroup new];
	effectGroup.motionEffects = @[horizontalParallaxEffect, verticalParallaxEffect];

	[self addMotionEffect:effectGroup];
}


@end
