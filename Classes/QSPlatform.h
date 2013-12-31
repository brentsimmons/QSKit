//
//  QSPlatform.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/23/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import Foundation;

#if TARGET_OS_IPHONE

@import UIKit;

#define QS_IMAGE UIImage
#define QS_COLOR UIColor
#define QS_FONT UIFont
#define QS_EDGE_INSETS UIEdgeInsets

#define QSEdgeInsetsMake UIEdgeInsetsMake

#else

@import AppKit;

#define QS_IMAGE NSImage
#define QS_COLOR NSColor
#define QS_FONT NSFont
#define QS_EDGE_INSETS NSEdgeInsets

#define QSEdgeInsetsMake NSEdgeInsetsMake

#endif


/*iOS: Documents/ directory.
 Mac: ~/Application Support/AppName/
 
 If nil, gets appName from Info.plist -- @"CFBundleExecutable" key.
 It creates the folder and intermediate folders if necessary.
 (appName is ignored on iOS.)

 If something goes wrong it returns nil. The error is NSLogged.
 Panic, at that point, is strongly indicated.*/

NSString *QSDataFolder(NSString *appName);

