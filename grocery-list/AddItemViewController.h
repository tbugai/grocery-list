//
//  AddItemViewController.h
//  grocery-list
//
//  Created by Tim Bugai on 4/26/13.
//  Copyright (c) 2013 Collective Idea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@protocol AddItemDelegate <NSObject>

- (void)itemAddeded:(Item *)item;

@end


@interface AddItemViewController : UIViewController<UITextViewDelegate>

@property (nonatomic) IBOutlet UITextView *textView;
@property (nonatomic) id<AddItemDelegate> delegate;

@end
