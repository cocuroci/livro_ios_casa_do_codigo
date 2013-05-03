//
//  ViewController.h
//  NetworkingFlickr
//
//  Created by André Cocuroci on 03/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate> {
    NSArray *elementos;
    NSMutableArray *imagens;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

@end
