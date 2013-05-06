//
//  ViewController.m
//  TremeTreme
//
//  Created by André Cocuroci on 06/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ViewController.h"
#import "TremeTremeView.h"

@interface ViewController ()
- (void)criaTremeTremeView:(CGPoint)posicao comCor:(UIColor *)cor;
@end

@implementation ViewController

- (void)criaTremeTremeView:(CGPoint)posicao comCor:(UIColor *)cor
{
    CGRect r = CGRectMake(posicao.x, posicao.y, 60, 60);
    TremeTremeView *t = [[TremeTremeView alloc] initWithFrame:r];
    t.backgroundColor = cor;
    [self.view addSubview:t];
    [t release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self criaTremeTremeView:CGPointMake(50, 50) comCor:[UIColor blueColor]];
    [self criaTremeTremeView:CGPointMake(200, 150) comCor:[UIColor redColor]];
    [self criaTremeTremeView:CGPointMake(110, 250) comCor:[UIColor purpleColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
