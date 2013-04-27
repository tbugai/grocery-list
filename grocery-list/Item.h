//
//  Item.h
//  grocery-list
//
//  Created by Tim Bugai on 4/26/13.
//  Copyright (c) 2013 Collective Idea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic, assign) BOOL acquired;

+ (id)itemWithName:(NSString *)name;
- (id)initWithName:(NSString *)name;

@end
