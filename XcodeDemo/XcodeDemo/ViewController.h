//
//  ViewController.h
//  XcodeDemo
//
//  Created by ZhangBin on 12-8-27.
//  Copyright (c) 2012年 Wisdom. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kSwitchesSegmentIndex 0

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtUserName;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UILabel *lblScore;
@property (weak, nonatomic) IBOutlet UISlider *scoreSlide;
@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;
@property (weak, nonatomic) IBOutlet UIButton *btnPressed;

- (IBAction)slideChange:(id)sender;
- (IBAction)textFieldDone:(id)sender;
- (IBAction)tabChange:(id)sender;
- (IBAction)buttonPressed:(id)sender;
- (IBAction)switchChange;

@end
