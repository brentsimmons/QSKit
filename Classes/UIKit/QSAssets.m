//
//  QSAssets.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 10/31/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>
#import "QSAssets.h"


static UIImage *mostRecentPhotoInAssetsGroup(ALAssetsGroup *group);


void QSAssetsMostRecentPhoto(QSImageResultBlock imageResultBlock) {

	ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];

	[assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {

		UIImage *image = mostRecentPhotoInAssetsGroup(group);
		if (image != nil) {
			*stop = YES;

			dispatch_async(dispatch_get_main_queue(), ^{
				imageResultBlock(image);
			});
		}

	} failureBlock:^(NSError *error) {
		NSLog(@"QSMostRecentPhoto error: %@", error);
	}];
}


static UIImage *mostRecentPhotoInAssetsGroup(ALAssetsGroup *group) {

	if (group == nil) {
		return nil;
	}

	[group setAssetsFilter:[ALAssetsFilter allPhotos]];

	__block UIImage *image = nil;

	[group enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *asset, NSUInteger index, BOOL *stop) {

		if (asset != nil) {

			ALAssetRepresentation *representation = [asset defaultRepresentation];
			image = [UIImage imageWithCGImage:[representation fullScreenImage]];
			if (image != nil) {
				*stop = YES;
			}
		}
	}];

	return image;
}
