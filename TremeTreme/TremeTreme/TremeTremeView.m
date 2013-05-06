//
//  TremeTremeView.m
//  TremeTreme
//
//  Created by André Cocuroci on 06/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "TremeTremeView.h"
#import <QuartzCore/QuartzCore.h>

#define RADIANS(degrees) ((degrees * M_PI) / 180.0)

@interface TremeTremeView()
- (void)registraGestos;
- (void)enfeitaView;
@end

@implementation TremeTremeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self enfeitaView];
        [self registraGestos];
    }
    return self;
}

- (void)enfeitaView
{
    self.layer.masksToBounds = NO;
    self.layer.cornerRadius = 8;
    self.layer.shadowOffset = CGSizeMake(-2,2);
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = 0.5;
}

- (void)registraGestos
{
    UILongPressGestureRecognizer *toqueLongo = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(iniciaTremedeira:)];
    
    toqueLongo.minimumPressDuration = 0.3;
    [self addGestureRecognizer:toqueLongo];
    [toqueLongo release];
    
    UITapGestureRecognizer *toqueParar = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pararAnimacao)];
    
    toqueParar.numberOfTapsRequired = 2;
    [self addGestureRecognizer:toqueParar];
    [toqueParar release];
}

- (void)iniciaTremedeira:(UIGestureRecognizer *)gesto
{
    CGAffineTransform oscilaEsquerda = CGAffineTransformRotate(CGAffineTransformIdentity, RADIANS(-5.0));
    CGAffineTransform oscilaDireita  = CGAffineTransformRotate(CGAffineTransformIdentity, RADIANS(5.0));
    
    self.transform = oscilaEsquerda;
    
    UIViewAnimationOptions opcoes = UIViewAnimationOptionRepeat | UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionAutoreverse | UIViewAnimationCurveEaseOut;
    
    [UIView animateWithDuration:0.1 delay:0 options:opcoes animations:^{
        self.transform = oscilaDireita;
    } completion:nil];
}

- (void) pararAnimacao
{
    UIViewAnimationOptions opcoes = UIViewAnimationOptionBeginFromCurrentState;
    
    [UIView animateWithDuration:0 delay:0 options:opcoes animations:^{
        self.transform = CGAffineTransformIdentity;
    } completion:nil];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
