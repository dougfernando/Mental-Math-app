//
//  FirstViewController.h
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/16/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Operation.h"

@interface FirstViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;
@property (weak, nonatomic) IBOutlet UIButton *button7;
@property (weak, nonatomic) IBOutlet UIButton *button8;
@property (weak, nonatomic) IBOutlet UIButton *button9;
@property (weak, nonatomic) IBOutlet UIButton *button0;
@property (weak, nonatomic) IBOutlet UIButton *buttonDot;
@property (weak, nonatomic) IBOutlet UIButton *buttonDel;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@property (weak, nonatomic) IBOutlet UITextField *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *arg1Label;
@property (weak, nonatomic) IBOutlet UILabel *arg2Label;
@property (weak, nonatomic) IBOutlet UILabel *operatorLabel;
@property (readwrite) Operation *currentOperation;

- (IBAction)button1Click:(id)sender;
- (IBAction)button2Click:(id)sender;
- (IBAction)button3Click:(id)sender;
- (IBAction)button4Click:(id)sender;
- (IBAction)button5Click:(id)sender;
- (IBAction)button6Click:(id)sender;
- (IBAction)button7Click:(id)sender;
- (IBAction)button8Click:(id)sender;
- (IBAction)button9Click:(id)sender;
- (IBAction)button0Click:(id)sender;
- (IBAction)buttonDotClick:(id)sender;
- (IBAction)buttonDelClick:(id)sender;
- (IBAction)buttonConfirmClick:(id)sender;

- (void) setNewOperation;
- (void) appendNumber:(id)input;
- (void) deleteLastNumber;

@end
