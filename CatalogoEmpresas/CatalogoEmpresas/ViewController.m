//
//  ViewController.m
//  CatalogoEmpresas
//
//  Created by André Cocuroci on 02/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ViewController.h"
#import "Empresa.h"
#import "ExibeCatalogoControllerViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated
{
    self.title = @"Cadastro";
}

- (void)dealloc
{
    [_nomeField release];
    [_quantidadeField release];
    [super dealloc];
}

- (void)viewDidUnload
{
    [self setNomeField:nil];
    [self setQuantidadeField:nil];
    [super viewDidUnload];
}

- (IBAction)incrementadorAlterado:(id)sender
{
    UIStepper *incrementador = (UIStepper *)sender;
    self.quantidadeField.text = [NSString stringWithFormat:@"%d", (int)incrementador.value];
}

- (void) salvarEmpresa:(Empresa *) novaEmpresa
{
    if(!catalogo)
    {
        catalogo = [[NSMutableArray alloc] init];
    }
    
    [catalogo addObject:novaEmpresa];
}

- (void) mostraCatalogo
{
    NSLog(@"******* Listando todas as empresas (%d) *******", catalogo.count);
    
    for(Empresa *empresa in catalogo)
    {
        NSLog(@"A empresa %@ tem %d funcionários", empresa.nome, empresa.quantidadeFuncionarios);
    }
}

- (IBAction)salvar:(id)sender
{
    //Empresa *e = [[Empresa alloc] init];
    //e.nome = self.nomeField.text;
    //e.quantidadeFuncionarios = [self.quantidadeField.text intValue];
    
    [self.nomeField resignFirstResponder];
    
    Empresa *e = [[Empresa alloc] initWithNome:self.nomeField.text eQuantidadeDeFuncionarios:[self.quantidadeField.text intValue]];
    
    [self salvarEmpresa:e];
    //[self mostraCatalogo];
    
    ExibeCatalogoControllerViewController *c = [[ExibeCatalogoControllerViewController alloc] init];
    c.catalogo = catalogo;
    
    [self.navigationController pushViewController:c animated:YES];
    
    [c release];
    [e release];
}

@end
