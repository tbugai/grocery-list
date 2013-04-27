//
//  AddItemViewController.m
//  grocery-list
//
//  Created by Tim Bugai on 4/26/13.
//  Copyright (c) 2013 Collective Idea. All rights reserved.
//

#import "AddItemViewController.h"

@implementation AddItemViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(disableAnimations:) name:UIKeyboardWillShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enableAnimations:) name:UIKeyboardDidShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(disableAnimations:) name:UIKeyboardWillHideNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enableAnimations:) name:UIKeyboardDidHideNotification object:nil];
	
	[_textView becomeFirstResponder];
}

- (void)enableAnimations:(NSNotification *)sender {
	[UIView setAnimationsEnabled:YES];
}

- (void)disableAnimations:(NSNotification *)sender {
	[UIView setAnimationsEnabled:NO];
}

#pragma mark UITextView Delegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
	if ([text isEqualToString:@"\n"]) {
		Item *item = [Item itemWithName:textView.text];
		[_delegate itemAddeded:item];
		textView.text = @"";
		return NO;
	}
	return YES;
}

@end
