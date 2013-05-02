//
//  ViewController.h
//  TableViewSimpleContactList
//
//  Created by André Cocuroci on 02/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *contatos;
}

@property (retain, nonatomic) IBOutlet UITableView *tabelaContatos;

@end
