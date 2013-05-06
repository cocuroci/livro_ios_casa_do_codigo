//
//  ViewController.m
//  TapCirculos
//
//  Created by André Cocuroci on 06/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ViewController.h"
#import "TapCirtuloView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    TapCirtuloView *c = [[[TapCirtuloView alloc] init] autorelease];
    c.backgroundColor = [UIColor whiteColor];
    self.view = c;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
