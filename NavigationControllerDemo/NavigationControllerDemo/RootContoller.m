//
//  ViewController.m
//  NavigationControllerDemo
//
//  Created by André Cocuroci on 02/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "RootContoller.h"
#import "AdicionarController.h"
#import "ConfiguracoesController.h"

@interface RootContoller ()

@end

@implementation RootContoller

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Root Controller";    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)abrirAdicionar:(id)sender
{
    AdicionarController *c = [[AdicionarController alloc] init];
    [self.navigationController pushViewController:c animated:YES];
    [c release];
}

- (IBAction)abrirConfiguracoes:(id)sender
{
    ConfiguracoesController *c = [[ConfiguracoesController alloc] init];
    [self.navigationController pushViewController:c animated:YES];
    [c release];    
}

@end
