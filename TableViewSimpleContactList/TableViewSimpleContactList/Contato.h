//
//  Contato.h
//  TableViewSimpleContactList
//
//  Created by André Cocuroci on 02/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contato : NSObject

@property (nonatomic, retain) NSString *nome;
@property (nonatomic, retain) NSString *telefone;

- (id) initWithName:(NSString *)initName andPhone:(NSString *)initPhone;

@end
