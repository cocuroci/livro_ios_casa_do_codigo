//
//  ViewController.m
//  ExemploDownload
//
//  Created by André Cocuroci on 03/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPRequestOperation.h"

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

- (void)viewDidUnload
{
    [super viewDidUnload];
}

-(IBAction)startDownload:(id)sender
{
    NSURL *url = [NSURL URLWithString:downloadField.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSString *saveFilename = [self downloadSavePathFor:url.lastPathComponent];
    
    NSLog(@"Salvando o arquivo em: %@", saveFilename);
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.outputStream = [NSOutputStream outputStreamToFileAtPath:saveFilename append:YES];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        [loadingIndicator stopAnimating];
        loadingIndicator.hidden = YES;
        
        [self showMessage:@"Download finalizado com sucesso"];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [loadingIndicator stopAnimating];
        loadingIndicator.hidden = YES;
        [self showMessage:[NSString stringWithFormat:@"Erro no download: %@", [error localizedDescription]]];
    }];
    
    [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
        progressBar.progress = (float)totalBytesRead / (float)totalBytesExpectedToRead;
    }];
    
    progressBar.hidden = NO;
    loadingIndicator.hidden = NO;
    [loadingIndicator startAnimating];
    
    [operation start];
}

-(NSString *)downloadSavePathFor:(NSString *)filename
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    return [documentsPath stringByAppendingPathComponent:filename];
}

-(void)showMessage:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Aviso" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end
