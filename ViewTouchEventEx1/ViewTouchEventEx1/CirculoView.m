//
//  CirculoView.m
//  ViewTouchEventEx1
//
//  Created by André Cocuroci on 06/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "CirculoView.h"

@implementation CirculoView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Recebido touchesBegan");
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(!circulos)
    {
        circulos = [[NSMutableArray alloc] init];
    }
    
    NSLog(@"Recebido touchesEnded. Registrando o ponto de toque");
    
    UITouch *toque = [touches anyObject];
    CGPoint localizacaoToque = [toque locationInView:self];
    
    [circulos addObject:[NSValue valueWithCGPoint:localizacaoToque]];
    
    [self setNeedsDisplay];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef contexto = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(contexto, 2.0);
    CGColorRef corFundo = [UIColor redColor].CGColor;
    CGContextSetFillColor(contexto, CGColorGetComponents(corFundo));
    int tamanho = 25;
    
    for(NSValue *item in circulos)
    {
        CGPoint ponto = [item CGPointValue];
        CGRect regiao = CGRectMake(ponto.x, ponto.y, tamanho, tamanho);
        CGContextAddEllipseInRect(contexto, regiao);
        CGContextFillEllipseInRect(contexto, regiao);
    }
    
    CGContextStrokePath(contexto);
}


@end
