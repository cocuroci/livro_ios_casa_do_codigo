//
//  ViewController.m
//  GestoSwipe
//
//  Created by André Cocuroci on 06/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (void)criaQuadrado;
- (void)registraGestos;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self criaQuadrado];
    [self registraGestos];
}

- (void)criaQuadrado
{
    float x  = (self.view.frame.size.width / 2) - 50;
    float y  = (self.view.frame.size.height / 2) - 50;    
    
    CGRect r = [[UIScreen mainScreen] bounds];
    CGRect actualyScreenFrame = [[UIScreen mainScreen] applicationFrame];
    
    NSLog(@"Largura: %f - Altura: %f",self.view.frame.size.width,self.view.frame.size.height);
    NSLog(@"Largura2: %f - Altura2: %f",r.size.width,r.size.height);
    NSLog(@"Largura3: %f - Altura3: %f",actualyScreenFrame.size.width,actualyScreenFrame.size.height);
    
    quadrado = [[UIView alloc] initWithFrame:CGRectMake(x, y, 100, 100)];
    quadrado.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:quadrado];
}

- (void)registraGestos
{
    [self adicionaGesto:UISwipeGestureRecognizerDirectionRight];
    [self adicionaGesto:UISwipeGestureRecognizerDirectionLeft];
}

- (void)adicionaGesto:(UISwipeGestureRecognizerDirection) direcao
{
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(jogaQuadrado:)];
    
    swipe.direction = direcao;
    [self.view addGestureRecognizer:swipe];
    [swipe release];
}

- (void)jogaQuadrado:(UIGestureRecognizer *)gesto
{
    CGPoint location = [gesto locationInView:quadrado];
    
    if([quadrado pointInside:location withEvent:nil])
    {
        UISwipeGestureRecognizer *swipe = (UISwipeGestureRecognizer *)gesto;
        
        float novoX = swipe.direction == UISwipeGestureRecognizerDirectionLeft ? 5 : ((self.view.frame.size.width - quadrado.frame.size.width) - 5);
        
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGRect frame = quadrado.frame;
            frame.origin.x = novoX;
            quadrado.frame = frame;
        } completion:nil];
    }
}

- (void)dealloc
{
    [quadrado release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
