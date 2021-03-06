//
//  ViewController.m
//  XcodeDemo
//
//  Created by ZhangBin on 12-8-27.
//  Copyright (c) 2012年 Wisdom. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize portrait;
@synthesize landscape;
@synthesize txtUserName;
@synthesize txtPassword;
@synthesize lblScore;
@synthesize scoreSlide;
@synthesize leftSwitch;
@synthesize rightSwitch;
@synthesize btnPressed;
@synthesize tab;

- (IBAction)slideChange:(id)sender
{
    UISlider *slider=(UISlider *)sender;
    int source=(int)(slider.value +0.5f);
    NSString *newTxt=[[NSString alloc]initWithFormat:@"%d",source];
    lblScore.text=newTxt;
}
- (IBAction)textFieldDone:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction)tabChange:(id)sender
{
    if([sender selectedSegmentIndex]== kSwitchesSegmentIndex)
    {
        leftSwitch.hidden=NO;
        rightSwitch.hidden=NO;
        btnPressed.hidden=YES;
    }else
    {
        leftSwitch.hidden=YES;
        rightSwitch.hidden=YES;
        btnPressed.hidden=NO;

    }
}

- (IBAction)buttonPressed{
    /*
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"Are you sure?"
                                  delegate:self
                                  cancelButtonTitle:@"No Way!"
                                  destructiveButtonTitle:@"Yes, I’m Sure!"
                                  otherButtonTitles:nil];
    [actionSheet showInView:self.view];
     */
    //[actionsheet release];
}

//屏幕翻转事件
-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    /*
    switch (toInterfaceOrientation) {
        case UIInterfaceOrientationPortrait:
            self.view=self.portrait;
            self.view.transform=CGAffineTransformIdentity;
            self.view.transform=CGAffineTransformMakeRotation(degreesToRadians(0));
            self.view.bounds=CGRectMake(0.0, 0.0, 320.0, 460.0);
            break;
        case UIInterfaceOrientationLandscapeLeft:
            self.view = self.landscape;
            self.view.transform = CGAffineTransformIdentity;
            self.view.transform =
            CGAffineTransformMakeRotation(degreesToRadians(-90));
            self.view.bounds = CGRectMake(0.0, 0.0, 480.0, 300.0);
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            self.view = self.portrait;
            self.view.transform = CGAffineTransformIdentity;
            self.view.transform =
            CGAffineTransformMakeRotation(degreesToRadians(180));
            self.view.bounds = CGRectMake(0.0, 0.0, 320.0, 460.0);
            break;
        case UIInterfaceOrientationLandscapeRight:
            self.view = self.landscape;
            self.view.transform = CGAffineTransformIdentity;
            self.view.transform =
            CGAffineTransformMakeRotation(degreesToRadians(90));
            self.view.bounds = CGRectMake(0.0, 0.0, 480.0, 300.0);
            break;
        default:
            break;
    }
     */
}

//委托方法
- (void)actionSheet:(UIActionSheet *)actionSheet
didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != [actionSheet cancelButtonIndex])
    {
		NSString *msg = nil;
		
		if (txtPassword.text.length > 0)
			msg = [[NSString alloc] initWithFormat:
				   @"You can breathe easy, %@, everything went OK.",
				   txtPassword.text];
		else
			msg = @"You can breathe easy, everything went OK.";
		UIAlertView *alert = [[UIAlertView alloc]
							  initWithTitle:@"Something was done"
							  message:msg
							  delegate:self
							  cancelButtonTitle:@"Phew!"
							  otherButtonTitles:nil];
		[alert show];
    }
}

- (IBAction)switchChange:(id)sender {
    UISwitch *switchSwitch=(UISwitch *)sender;
    BOOL switchIsOn = switchSwitch.isOn;
    [leftSwitch setOn:switchIsOn animated:YES];
    [rightSwitch setOn:switchIsOn animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    btnPressed.hidden=YES;
    UIImage *btnImageNormal=[UIImage imageNamed:@"whiteButton.png"];
    UIImage *stretchableImageNormal=[btnImageNormal stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [btnPressed setBackgroundImage:stretchableImageNormal forState:UIControlStateNormal];
    
    UIImage *btnImageClick=[UIImage imageNamed:@"blueButton.png"];
    UIImage *btnClickBackgroundImage=[btnImageClick stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [btnPressed setBackgroundImage:btnClickBackgroundImage forState:UIControlStateHighlighted];
    
}

- (void)viewDidUnload
{
    [self setTxtUserName:nil];
    [self setTxtUserName:nil];
    [self setTxtPassword:nil];
    [self setLblScore:nil];
    [self setScoreSlide:nil];
    [self setLeftSwitch:nil];
    [self setRightSwitch:nil];
    [self setBtnPressed:nil];
    [self setTab:nil];
    [self setPortrait:nil];
    [self setLandscape:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
