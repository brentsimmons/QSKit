//
//  QSOPMLFolder.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 11/1/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import Foundation;


@interface QSOPMLFolder : NSObject

@property (nonatomic) NSString *title;

+ (instancetype)OPMLFolderWithXMLAttributes:(NSDictionary *)attributes;


@end
