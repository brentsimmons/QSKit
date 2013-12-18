//
//  QSNode.m
//  Q Branch Standard Kit
//
//  Created by Brent Simmons on 11/1/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "QSNode.h"
#import "NSObject+QSKit.h"


@interface QSNode ()

@property (nonatomic, copy, readwrite) NSArray *children;

@end


@interface NSObject (QSNodeDebugging)

- (NSDictionary *)dictionaryRepresentation;

@end



@implementation QSNode


#pragma mark - Class Methods

+ (instancetype)nodeWithRepresentedObject:(id)representedObject parent:(QSNode *)parent {

	QSNode *node = [QSNode new];
	node.representedObject = representedObject;
	node.parent = parent;

	return node;
}


#pragma mark - Sort Comparator

- (NSComparator)logicalSortComparator {

	QSNode *nomad = self;

	while (nomad != nil) {

		if (nomad.sortComparator != nil) {
			return nomad.sortComparator;
		}

		nomad = nomad.parent;
	}

	return nil;
}


#pragma mark - Children

- (void)updateChildren:(NSArray *)children {

	if ([children isEqualToArray:self.children]) {
		return;
	}

	/*Sort if there's a sort comparator.*/

	NSComparator comparator = [self logicalSortComparator];
	if (comparator != nil) {
		children = [children sortedArrayUsingComparator:comparator];
	}

	self.children = children;
}


- (void)addChildren:(NSArray *)children {

	NSMutableArray *updatedChildren = [NSMutableArray new];
	[updatedChildren addObjectsFromArray:self.children];
	
	for (QSNode *oneNode in children) {

		if ([updatedChildren indexOfObjectIdenticalTo:oneNode] == NSNotFound) {
			[updatedChildren addObject:oneNode];
		}
	}

	if (![updatedChildren isEqualToArray:self.children]) {
		[self updateChildren:updatedChildren];
	}
}


- (void)deleteChildren:(NSArray *)children {

	NSMutableArray *updatedChildren = [NSMutableArray array];

	for (QSNode *oneNode in children) {

		NSUInteger childIndex = [updatedChildren indexOfObjectIdenticalTo:oneNode];
		if (childIndex != NSNotFound) {
			[updatedChildren removeObjectAtIndex:childIndex];
		}
	}

	if (![updatedChildren isEqualToArray:self.children]) {
		[self updateChildren:updatedChildren];
	}
}


- (void)addChildrenForRepresentedObjects:(NSArray *)representedObjects {

	NSMutableArray *addedChildren = [NSMutableArray new];

	for (id oneRepresentedObject in representedObjects) {

		QSNode *oneChild = [QSNode nodeWithRepresentedObject:oneRepresentedObject parent:self];
		[addedChildren addObject:oneChild];
	}

	[self addChildren:addedChildren];
}


- (void)deleteChildrenForRepresentedObjects:(NSArray *)representedObjects {

	NSMutableArray *childrenToDelete = [NSMutableArray new];

	for (QSNode *oneNode in self.children) {

		if ([representedObjects indexOfObjectIdenticalTo:oneNode.representedObject] != NSNotFound) {
			[childrenToDelete addObject:oneNode];
		}
	}

	[self deleteChildren:childrenToDelete];
}


#pragma mark - Debugging

- (NSString *)description {

	NSString *s = [super description];
	return  [NSString stringWithFormat:@"%@ - representedObject: %@", s, [self.representedObject description]];
}


- (NSDictionary *)dictionaryRepresentation {

	NSMutableDictionary *d = [NSMutableDictionary new];
	if ([self.representedObject respondsToSelector:@selector(dictionaryRepresentation)]) {
		d = [[self.representedObject dictionaryRepresentation] mutableCopy];
	}

	NSMutableArray *childrenDictionaries = [NSMutableArray new];

	for (QSNode *oneChild in self.children) {
		NSDictionary *oneDictionary = [oneChild dictionaryRepresentation];
		[childrenDictionaries addObject:oneDictionary];
	}

	if (!QSIsEmpty(childrenDictionaries)) {
		d[@"__children"] = childrenDictionaries;
	}

	return d;

}

@end
