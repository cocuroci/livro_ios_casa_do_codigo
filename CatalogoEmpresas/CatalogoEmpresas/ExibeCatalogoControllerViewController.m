//
//  ExibeCatalogoControllerViewController.m
//  CatalogoEmpresas
//
//  Created by André Cocuroci on 03/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ExibeCatalogoControllerViewController.h"
#import "Empresa.h"

@interface ExibeCatalogoControllerViewController ()

@end

@implementation ExibeCatalogoControllerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Empresas";
    NSLog(@"Empresas %@", self.catalogo);
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.catalogo.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ident = @"cell";
    UITableViewCell *cell = [self.tabela dequeueReusableCellWithIdentifier:ident];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ident];
    }
    
    Empresa *e = [self.catalogo objectAtIndex:indexPath.row];
    cell.textLabel.text = e.nome;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Funcionários: %d", e.quantidadeFuncionarios];
    
    return cell;
}

- (void)dealloc
{
    [_tabela release];
    [super dealloc];
}

- (void)viewDidUnload
{
    [self setTabela:nil];
    [super viewDidUnload];
}

@end
