//
//  ViewController.m
//  CatalogoEmpresas
//
//  Created by André Cocuroci on 02/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ViewController.h"
#import "Empresa.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.avisoSucessoLavel.hidden = YES;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_nomeField release];
    [_quantidadeField release];
    [_avisoSucessoLavel release];
    [super dealloc];
}

- (void)viewDidUnload
{
    [self setNomeField:nil];
    [self setQuantidadeField:nil];
    [self setAvisoSucessoLavel:nil];
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
    [self mostraCatalogo];
    
    [e release];
    
    self.avisoSucessoLavel.alpha = 0;
    
    [UIView animateWithDuration:1 animations:^{
        self.avisoSucessoLavel.hidden = NO;
        self.avisoSucessoLavel.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 delay:2 options:0 animations:^{
            self.avisoSucessoLavel.alpha = 0;   
        } completion:^(BOOL finished) {
            self.avisoSucessoLavel.hidden = YES;
        }];
    }];
}

@end
