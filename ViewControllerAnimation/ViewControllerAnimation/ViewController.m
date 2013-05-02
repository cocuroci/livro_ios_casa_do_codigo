//
//  ViewController.m
//  ViewControllerAnimation
//
//  Created by André Cocuroci on 02/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ViewController.h"
#import "OpcoesController.h"

@interface ViewController ()

@end

@implementation ViewController

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

- (IBAction)showDissolve:(id)sender
{
    [self mostraControllerComAnimacao:UIModalTransitionStyleCrossDissolve];
}

- (IBAction)showPageCurl:(id)sender
{
    [self mostraControllerComAnimacao:UIModalTransitionStylePartialCurl];
}

- (IBAction)showVertical:(id)sender
{
    [self mostraControllerComAnimacao:UIModalTransitionStyleCoverVertical];
}

- (IBAction)showHorizontal:(id)sender
{
    [self mostraControllerComAnimacao:UIModalTransitionStyleFlipHorizontal];
}

- (void) mostraControllerComAnimacao:(UIModalTransitionStyle) estilo
{
    OpcoesController *c = [[OpcoesController alloc] init];
    c.modalTransitionStyle = estilo;
    //DEPRECIADO
    //[self presentModalViewController:c animated:YES];
    [self presentViewController:c animated:YES completion:nil];
    [c release];
}

@end
