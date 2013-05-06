//
//  ViewController.h
//  MinhaLocalizacao
//
//  Created by André Cocuroci on 06/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate>

@property (retain, nonatomic) IBOutlet MKMapView *mapa;

@end
