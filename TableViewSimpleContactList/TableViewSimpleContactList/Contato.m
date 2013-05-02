//
//  Contato.m
//  TableViewSimpleContactList
//
//  Created by André Cocuroci on 02/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "Contato.h"

@implementation Contato

- (id) initWithName:(NSString *)initName andPhone:(NSString *)initPhone
{
    
    if((self = [super init]))
    {
        self.nome = initName;
        self.telefone = initPhone;
    }

    return self;
}

- (void) dealloc
{
    [self.nome  release];
    [self.telefone release];
    [super dealloc];
}

@end
