//
//  ViewController.h
//  CatalogoEmpresas
//
//  Created by André Cocuroci on 02/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSMutableArray *catalogo;
}

@property (retain, nonatomic) IBOutlet UITextField *nomeField;
@property (retain, nonatomic) IBOutlet UITextField *quantidadeField;

- (IBAction)incrementadorAlterado:(id)sender;
- (IBAction)salvar:(id)sender;

@end
