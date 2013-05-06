//
//  LoginView.m
//  CustomView
//
//  Created by André Cocuroci on 06/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "LoginView.h"
#import <QuartzCore/QuartzCore.h>

@implementation LoginView

-(id)init
{
    if((self = [super init]))
    {
        [self controiTela];
    }
    return self;
}

-(void)controiTela
{
    self.frame = CGRectMake(0, 0, 300, 150);
    self.backgroundColor = [UIColor colorWithRed:210./255.0 green:210.0/255.0 blue:210.0/255.0 alpha:1];
    self.layer.cornerRadius = 10;
	self.layer.shadowOffset = CGSizeMake(-1, 6);
	self.layer.masksToBounds = NO;
	self.layer.shadowOpacity = 0.5;
	self.layer.shadowRadius = 5;
	self.layer.shadowColor = [UIColor blackColor].CGColor;
	
	// Borda
	UIView *borda = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 280, 95)];
	borda.backgroundColor = [UIColor whiteColor];
	borda.layer.borderColor = [UIColor blackColor].CGColor;
	borda.layer.cornerRadius = 10;
	[self addSubview:borda];
	[borda release];
	
	// Labels
	UIFont *fonte = [UIFont fontWithName:@"Georgia-Bold" size:16];
	UIColor *corLabel = [UIColor colorWithRed:60.0/255.0 green:60.0/255.0 blue:60.0/255.0 alpha:1];
    
	UILabel *usuarioLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 100, 20)];
	usuarioLabel.font = fonte;
	usuarioLabel.textColor = corLabel;
	usuarioLabel.text = @"Usuário";
	[borda addSubview:usuarioLabel];
	[usuarioLabel release];
	
	UILabel *senhaLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, 100, 20)];
	senhaLabel.font = fonte;
	senhaLabel.textColor = corLabel;
	senhaLabel.text = @"Senha";
	[borda addSubview:senhaLabel];
	[senhaLabel release];
	
	// Campos texto
	UIColor *corCampoTexto = [UIColor colorWithRed:170.0/255.0 green:170.0/255.0 blue:170.0/255.0 alpha:1];
    
	UITextField *usuarioField = [[UITextField alloc] initWithFrame:CGRectMake(110, 15, 150, 20)];
	usuarioField.borderStyle = UITextBorderStyleNone;
	usuarioField.autocorrectionType = UITextAutocorrectionTypeNo;
	usuarioField.autocapitalizationType = UITextAutocapitalizationTypeNone;
	usuarioField.textColor = corCampoTexto;
	usuarioField.placeholder = @"Informe o usuário";
	[borda addSubview:usuarioField];
	[usuarioField release];
	
	UITextField *senhaField = [[UITextField alloc] initWithFrame:CGRectMake(110, 60, 150, 20)];
	senhaField.borderStyle = UITextBorderStyleNone;
	senhaField.secureTextEntry = YES;
	senhaField.textColor = corCampoTexto;
	senhaField.placeholder = @"Informe a senha";
	[borda addSubview:senhaField];
	[senhaField release];
	
	// Linha horizontal divisória entre os campos
	UIView *linhaFina = [[UIView alloc] initWithFrame:CGRectMake(20, 50, 240, 1)];
	linhaFina.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1];
	[borda addSubview:linhaFina];
	[linhaFina release];
	
	// Botao
	UIButton *botaoLogin = [[UIButton alloc] initWithFrame:CGRectMake(0, 113, 180, 30)];
	botaoLogin.backgroundColor = [UIColor colorWithRed:73.0/255.0 green:91.0/255.0 blue:227.0/255.0 alpha:1];
	botaoLogin.layer.cornerRadius = 8;
	botaoLogin.layer.borderWidth = 1.5;
	botaoLogin.layer.masksToBounds = YES;
	[botaoLogin setTitle:@"Login" forState:UIControlStateNormal];
	botaoLogin.titleLabel.textAlignment = NSTextAlignmentCenter;
	
	CGRect botaoFrame = botaoLogin.frame;
	botaoFrame.origin.x = (self.frame.size.width - botaoFrame.size.width) / 2;
	botaoLogin.frame = botaoFrame;
	
	[self addSubview:botaoLogin];
	[botaoLogin release];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
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
