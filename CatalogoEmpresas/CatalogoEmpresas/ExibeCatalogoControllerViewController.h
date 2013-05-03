//
//  ExibeCatalogoControllerViewController.h
//  CatalogoEmpresas
//
//  Created by André Cocuroci on 03/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExibeCatalogoControllerViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) IBOutlet UITableView *tabela;
@property (nonatomic, retain) NSArray *catalogo;
@end
