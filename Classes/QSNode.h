//
//  QSNode.h
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 11/1/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//


@import Foundation;


/*Tree.
 
 Single thread or serial queue access only.*/


@interface QSNode : NSObject


/*representedObject and parent may be nil.*/

+ (instancetype)nodeWithRepresentedObject:(id)representedObject parent:(QSNode *)parent;


/*Each of these properties may by nil.*/

@property (nonatomic, weak) QSNode *parent; /*nil for root node.*/
@property (nonatomic) id representedObject;
@property (nonatomic, copy, readonly) NSArray *children;


/*If there's a sortComparator, then children are automatically sorted when changed.
 A node will find and use a descendant's sortComparator by traveling toward the root node.*/

@property (nonatomic, copy) NSComparator sortComparator;


/*A child appears only once, uniqued by pointer equality.
 These take arrays of QSNode.*/

- (void)addChildren:(NSArray *)children;
- (void)deleteChildren:(NSArray *)children;


/*These take arrays of id. No uniquing. A given representedObject can appear more than once.*/

- (void)addChildrenForRepresentedObjects:(NSArray *)representedObjects;
- (void)deleteChildrenForRepresentedObjects:(NSArray *)representedObjects;

/*For debugging and visualization only. Don't rely on format.*/

- (NSDictionary *)dictionaryRepresentation;

@end
