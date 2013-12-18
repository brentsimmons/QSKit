//
//  UIViewController+QSKit.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/21/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "UIViewController+QSKit.h"


@implementation UIViewController (QSKit)


- (BOOL)qs_hasChildViewController {
	return [self.childViewControllers count] > 0;
}


@end
