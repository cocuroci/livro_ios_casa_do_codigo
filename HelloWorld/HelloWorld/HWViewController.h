//
//  HWViewController.h
//  HelloWorld
//
//  Created by André Cocuroci on 02/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWViewController : UIViewController
- (IBAction)hideView:(id)sender;
- (IBAction)showView:(id)sender;
@property (retain, nonatomic) IBOutlet UIView *workingView;

@end
