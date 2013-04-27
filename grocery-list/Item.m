//
//  Item.m
//  grocery-list
//
//  Created by Tim Bugai on 4/26/13.
//  Copyright (c) 2013 Collective Idea. All rights reserved.
//

#import "Item.h"

@implementation Item

+ (id)itemWithName:(NSString *)name {
	return [[Item alloc] initWithName:name];
}

- (id)initWithName:(NSString *)name {
	if (self = [super init]) {
		_name = name;
		_acquired = NO;
	}
	return self;
}

@end
