//
//  ConfiguracoesController.m
//  NavigationControllerDemo
//
//  Created by André Cocuroci on 02/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ConfiguracoesController.h"
#import "DadosAcessoController.h"

@interface ConfiguracoesController ()

@end

@implementation ConfiguracoesController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)abreDadosAcesso:(id)sender
{
    DadosAcessoController *c = [[DadosAcessoController alloc] init];
    [self.navigationController pushViewController:c animated:YES];
    [c release];
}

@end
