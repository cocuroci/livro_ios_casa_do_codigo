//
//  ViewController.h
//  ExemploDownload
//
//  Created by André Cocuroci on 03/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    IBOutlet UITextField *downloadField;
    IBOutlet UIProgressView *progressBar;
    IBOutlet UIActivityIndicatorView *loadingIndicator;
}

-(IBAction)startDownload:(id)sender;

@end
