//
//  ViewController.m
//  grocery-list
//
//  Created by Tim Bugai on 4/20/13.
//  Copyright (c) 2013 Collective Idea. All rights reserved.
//

#import "MainViewController.h"
#import "AddItemViewController.h"

@implementation MainViewController
- (void)viewDidLoad {
	groceryList.accessibilityLabel = @"Grocery List";
	list = [@[
		[Item itemWithName:@"Milk"],
		[Item itemWithName:@"Eggs"],
		[Item itemWithName:@"Bread"]
	] mutableCopy];
	
	currentOrientation = [[UIDevice currentDevice] orientation];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleDeviceRotation:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (BOOL)shouldAutorotate {
	return NO;
}

#pragma mark Notification Center Handlers

- (void)handleDeviceRotation:(NSNotification *)sender {
	UIDeviceOrientation newOrientation = [[UIDevice currentDevice] orientation];
	
	if (newOrientation == currentOrientation || newOrientation == UIDeviceOrientationFaceDown || newOrientation == UIDeviceOrientationFaceUp || newOrientation == UIDeviceOrientationUnknown) {
		return;
	}
	
	if (currentOrientation == UIDeviceOrientationPortrait && UIDeviceOrientationIsLandscape(newOrientation)) {
		AddItemViewController *addItemViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AddItem"];
		addItemViewController.delegate = self;
		
		addItemViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
		[self presentViewController:addItemViewController animated:YES completion:nil];
	} else if (UIDeviceOrientationIsLandscape(currentOrientation) && newOrientation == UIDeviceOrientationPortrait) {
		[self dismissViewControllerAnimated:YES completion:nil];
	}
	currentOrientation = newOrientation;
}


#pragma mark UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell"];
	
	Item *thisItem = list[indexPath.row];
	
	cell.textLabel.text = thisItem.name;
	cell.imageView.image = [UIImage imageNamed:@"acquired"];
	cell.imageView.hidden = YES;
	
	return cell;
}

#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	Item *thisItem = list[indexPath.row];
	thisItem.acquired = !thisItem.acquired;
	
	cell.accessibilityLabel = thisItem.acquired ? [NSString stringWithFormat:@"%@-Acquired", thisItem.name] : thisItem.name;
	cell.imageView.hidden = !thisItem.acquired;
}

#pragma mark AddItem Delegate

- (void)itemAddeded:(Item *)item {
	//[list addObject:item];
	[groceryList reloadData];
}
@end
