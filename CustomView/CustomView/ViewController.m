//
//  ViewController.m
//  CustomView
//
//  Created by André Cocuroci on 06/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ViewController.h"
#import "LoginView.h"

@interface ViewController () {
    LoginView *login;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    login = [[LoginView alloc] init];
    
    CGRect frame = login.frame;
    frame.origin.x = 10;
    frame.origin.y = 10;
    login.frame = frame;
    
    [self.view addSubview:login];    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
