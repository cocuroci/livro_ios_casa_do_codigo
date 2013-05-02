//
//  HWViewController.m
//  HelloWorld
//
//  Created by André Cocuroci on 02/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "HWViewController.h"

@interface HWViewController ()

@end

@implementation HWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)hideView:(id)sender
{
    [UIView beginAnimations:nil context:nil];
    self.workingView.alpha = 0;
    //self.workingView.hidden = YES;
    [UIView commitAnimations];
}


- (IBAction)showView:(id)sender
{
    [UIView beginAnimations:nil context:nil];
    self.workingView.alpha = 1;
    //self.workingView.hidden = NO;
    [UIView commitAnimations];
}

- (void)dealloc
{
    [_workingView release];
    [super dealloc];
}

- (void)viewDidUnload
{
    [self setWorkingView:nil];
    [super viewDidUnload];
}
@end
