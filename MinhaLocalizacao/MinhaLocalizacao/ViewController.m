//
//  ViewController.m
//  MinhaLocalizacao
//
//  Created by André Cocuroci on 06/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UILongPressGestureRecognizer *toque = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(adicionaPino:)];
    
    toque.minimumPressDuration = 0.5;
    [self.mapa addGestureRecognizer:toque];
    [toque release];
    
    //self.mapa.showsUserLocation = YES;
    //self.mapa.delegate = self;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)adicionaPino:(UIGestureRecognizer *)gesto
{
    if(gesto.state == UIGestureRecognizerStateBegan)
    {
        CGPoint ponto = [gesto locationInView:self.view];
        CLLocationCoordinate2D coordenadas = [self.mapa convertPoint:ponto toCoordinateFromView:self.mapa];
        
        MKPointAnnotation *pino = [[MKPointAnnotation alloc] init];
        pino.coordinate = coordenadas;
        [self.mapa addAnnotation:pino];
        [pino release];
    }
}

- (void) mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    MKAnnotationView *v = [views objectAtIndex:0];
    CLLocationDistance distancia = 400;
    MKCoordinateRegion regiao = MKCoordinateRegionMakeWithDistance([v.annotation coordinate], distancia, distancia);
    
    [self.mapa setRegion:regiao animated:YES];
}

- (void) mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    NSLog(@"pino %@ selecionado", view);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_mapa release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setMapa:nil];
    [super viewDidUnload];
}
@end
