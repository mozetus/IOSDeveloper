//
//  ViewController.h
//  WebViewDemo
//
//  Created by ZhangBin on 12-8-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate> {
    
    UITextField *urlTxt;
    UIBarButtonItem *btnGoto;
    UIWebView *webView;
    UIActivityIndicatorView *activityIndicatorView;
    UINavigationBar *barTop;
    UIButton *btnBarControl;
}

@property (strong, nonatomic) IBOutlet UITextField *urlTxt;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnGoto;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UINavigationBar *barTop;
@property (strong, nonatomic) IBOutlet UIButton *btnBarControl;

@property (strong, nonatomic) NSUserDefaults *userDefaults;

-(IBAction)btnPrerss:(id)sender;
-(void)loadWebPageWithString:(NSString *)urlString;
- (IBAction)BarHideOrShow:(id)sender;

@end
