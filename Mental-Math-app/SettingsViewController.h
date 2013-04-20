//
//  SettingsViewController.h
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/20/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *levelSegment;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (weak, nonatomic) IBOutlet UISwitch *addOp;
@property (weak, nonatomic) IBOutlet UISwitch *subOp;
@property (weak, nonatomic) IBOutlet UISwitch *multipOp;
@property (weak, nonatomic) IBOutlet UISwitch *divOp;
@property (weak, nonatomic) IBOutlet UISwitch *percOp;
@property (weak, nonatomic) IBOutlet UISegmentedControl *timeSegment;
- (IBAction)valueChanged:(id)sender;
- (IBAction)addOpChanged:(id)sender;
- (IBAction)subOpChanged:(id)sender;
- (IBAction)multipOpChanged:(id)sender;
- (IBAction)divOpChanged:(id)sender;
- (IBAction)percOpChanged:(id)sender;
- (IBAction)timeChanged:(id)sender;

@end
