//
//  ViewController.m
//  TableViewSimpleContactList
//
//  Created by André Cocuroci on 02/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ViewController.h"
#import "Contato.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadContacts];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_tabelaContatos release];
    [super dealloc];
}

- (void)viewDidUnload
{
    [self setTabelaContatos:nil];
    [super viewDidUnload];
}

- (void) loadContacts
{
    NSString *plisPath = [[NSBundle mainBundle] pathForResource:@"contatos" ofType:@"plist"];
    NSDictionary *pl = [NSDictionary dictionaryWithContentsOfFile:plisPath];
    NSArray *data = [pl objectForKey:@"contatos"];
    
    contatos = [[NSMutableArray alloc] init];
    
    for(NSDictionary *item in data)
    {
        NSString *name = [item objectForKey:@"nome"];
        NSString *phone = [item objectForKey:@"telefone"];
        
        Contato *c = [[Contato alloc] initWithName:name andPhone:phone];
        [contatos addObject:c];
        [c release];        
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return contatos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identCell = @"identCell";
    UITableViewCell *cell = [self.tabelaContatos dequeueReusableCellWithIdentifier:identCell];
    
    if(!cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identCell] autorelease];
    }
    
    Contato *contato = [contatos objectAtIndex:indexPath.row];
    cell.textLabel.text = contato.nome;
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Contato *c = [contatos objectAtIndex:indexPath.row];
    NSString *msg = [NSString stringWithFormat:@"Nome: %@\nTelefone: %@", c.nome, c.telefone];
    
    UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Contato" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];
    
    [alert show];
    
    [self.tabelaContatos deselectRowAtIndexPath:indexPath animated:YES];
}

@end
