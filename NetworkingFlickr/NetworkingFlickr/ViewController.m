//
//  ViewController.m
//  NetworkingFlickr
//
//  Created by André Cocuroci on 03/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ViewController.h"
#import "AFJSONRequestOperation.h"
#import "UIImageView+AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSURL *url = [NSURL URLWithString:@"http://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        elementos = [JSON objectForKey:@"items"];
        //[self mostraMensagem:[NSString stringWithFormat:@"%d imagens encontradas", elementos.count]];
        
        if(elementos.count)
        {
            [self inicializaScroll];
        }
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
         [self mostraMensagem:[NSString stringWithFormat:@"Erro: %@", [error localizedDescription]]];
    }];
    
    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"application/x-javascript"]];
    [operation start];    
}

-(void)inicializaScroll
{
    float largura = self.scroll.frame.size.width;
    float altura  = self.scroll.frame.size.height;
    
    self.scroll.contentSize = CGSizeMake(largura * elementos.count, altura);
    self.scroll.pagingEnabled = YES;
    
    imagens = [[NSMutableArray alloc] init];
    
    int indice = 0;
    
    for(NSDictionary *item in elementos)
    {        
        CGRect posicao = CGRectMake(indice++ * largura, 0, largura, altura);
        UIImageView *img = [[UIImageView alloc] initWithFrame:posicao];
        [self.scroll addSubview:img];
        [imagens addObject:img];
        //indice++;
    }    
    
    [self carregaImagemRemota:0];
}

-(void)carregaImagemRemota:(int)indice
{
    paginaAtual = indice;
    
    NSDictionary *item = [elementos objectAtIndex:indice];
    NSString *url = [[item objectForKey:@"media"] objectForKey:@"m"];
    
    NSLog(@"Imagem url: %@", url);
    
    UIImageView *img = [imagens objectAtIndex:indice];
    img.contentMode = UIViewContentModeScaleAspectFit;
    
    [img setImageWithURL:[NSURL URLWithString:url]];
}

- (void)mostraMensagem:(NSString *)mensagem
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Atenção" message:mensagem delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int x = (int)self.scroll.contentOffset.x;
    int largura = self.scroll.frame.size.width;
    
    if(x % largura == 0)
    {
        int pagina = x / largura;
        [self carregaImagemRemota:pagina];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    NSLog(@"rotation");
    return YES;
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    float largura = self.scroll.frame.size.width;
    float altura  = self.scroll.frame.size.height;
    int indice = 0;
    
    self.scroll.contentSize = CGSizeMake(largura * elementos.count, altura);
    
    for(UIImageView *img in self.scroll.subviews)
    {
        if(img.frame.size.width > 7 && img.frame.size.height > 7)
        {
            img.frame = CGRectMake(indice++ * largura, 0, largura, altura);
        }
    }
    
    CGPoint novaPosicao = CGPointMake(largura * paginaAtual, 0);
    [self.scroll setContentOffset:novaPosicao animated:NO];
}

- (void)viewDidUnload
{
    [self setScroll:nil];
    [super viewDidUnload];
}
@end
