//
//  Empresa.m
//  CatalogoEmpresas
//
//  Created by André Cocuroci on 02/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "Empresa.h"

@implementation Empresa

-(void) dealloc
{
    [_nome release];
    [super dealloc];
}

-(id) initWithNome:(NSString *) nome eQuantidadeDeFuncionarios:(int)quantidade
{
    if((self = [super init]))
    {
        self.nome = nome;
        self.quantidadeFuncionarios = quantidade;
    }
    
    return self;
}

@end
