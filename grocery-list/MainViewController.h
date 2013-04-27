//
//  ViewController.h
//  grocery-list
//
//  Created by Tim Bugai on 4/20/13.
//  Copyright (c) 2013 Collective Idea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddItemViewController.h"

@interface MainViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, AddItemDelegate> {
	IBOutlet UIImageView *iconImageView;
	IBOutlet UITableView *groceryList;
	
	NSMutableArray *list;
	
	UIDeviceOrientation currentOrientation;
}

@end
