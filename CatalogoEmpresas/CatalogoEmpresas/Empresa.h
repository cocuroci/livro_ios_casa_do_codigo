//
//  Empresa.h
//  CatalogoEmpresas
//
//  Created by André Cocuroci on 02/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Empresa : NSObject {
    NSString *_nome;
    int _quantidadeFuncionarios;
}

@property (nonatomic, retain) NSString *nome;
@property (nonatomic, assign) int quantidadeFuncionarios;

-(id) initWithNome:(NSString *) nome eQuantidadeDeFuncionarios:(int)quantidade;

@end
