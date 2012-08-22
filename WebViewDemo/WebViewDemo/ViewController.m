//
//  ViewController.m
//  WebViewDemo
//
//  Created by ZhangBin on 12-8-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize urlTxt;
@synthesize btnGoto;
@synthesize webView;
@synthesize barTop;
@synthesize btnBarControl;
@synthesize userDefaults;

-(IBAction)btnPrerss:(id)sender
{
    [urlTxt resignFirstResponder];
    [self loadWebPageWithString:urlTxt.text];
    [userDefaults setObject:urlTxt.text forKey:@"webviewurl"];
    [userDefaults synchronize];
        
}
-(void)loadWebPageWithString:(NSString *)urlString
{
    NSURL *url=[NSURL URLWithString:urlString];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}
- (IBAction)BarHideOrShow:(id)sender
{
    barTop.hidden  = !barTop.hidden;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    webView.scalesPageToFit=YES;
    webView.delegate=self;
    activityIndicatorView=[[UIActivityIndicatorView alloc]
                           initWithFrame : CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    [activityIndicatorView setCenter: self.view.center];
    [activityIndicatorView setActivityIndicatorViewStyle: UIActivityIndicatorViewStyleWhite] ; 
    [self.view addSubview : activityIndicatorView];
    
    NSString *url=[userDefaults objectForKey:@"webviewurl"];
    if(url!=nil)
    {
        urlTxt.text=url;
    }
    [self btnPrerss:nil];
}

- (void)viewDidUnload
{
    [self setUrlTxt:nil];
    [self setUrlTxt:nil];
    [self setBtnGoto:nil];
    [self setWebView:nil];
    [self setBarTop:nil];
    [self setBarTop:nil];
    [self setBtnBarControl:nil];
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)webViewDidStartLoad:(UIButton *)webView
{
    [activityIndicatorView startAnimating];
}

-(void)webViewDidFinishLoad:(UIButton *)webView
{
    [activityIndicatorView stopAnimating];
    
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"" message:
                        [error localizedDescription]
                                                 delegate:nil
                                        cancelButtonTitle:nil otherButtonTitles:@"OK",nil];
    [alert show];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
