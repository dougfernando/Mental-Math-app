//
//  FirstViewController.h
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/16/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Operation.h"
#import "OperationList.h"
#import "BButton.h"

@interface FirstViewController : UIViewController
{
    NSTimer *timer;
    int secondsLeft;
}
@property (weak, nonatomic) IBOutlet BButton *button1;
@property (weak, nonatomic) IBOutlet BButton *button2;
@property (weak, nonatomic) IBOutlet BButton *button3;
@property (weak, nonatomic) IBOutlet BButton *button4;
@property (weak, nonatomic) IBOutlet BButton *button5;
@property (weak, nonatomic) IBOutlet BButton *button6;
@property (weak, nonatomic) IBOutlet BButton *button7;
@property (weak, nonatomic) IBOutlet BButton *button8;
@property (weak, nonatomic) IBOutlet BButton *button9;
@property (weak, nonatomic) IBOutlet BButton *button0;
@property (weak, nonatomic) IBOutlet BButton *button000;
@property (weak, nonatomic) IBOutlet BButton *buttonDel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *arg1Label;
@property (weak, nonatomic) IBOutlet UILabel *arg2Label;
@property (weak, nonatomic) IBOutlet UILabel *operatorLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLeftLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *timeProgressBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *restartButton;
@property (weak, nonatomic) IBOutlet BButton *myConfirmButton;
@property (readwrite) OperationList *operationList;

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
- (IBAction)button000Click:(id)sender;
- (IBAction)buttonDelClick:(id)sender;
- (IBAction)restartClick:(id)sender;
- (IBAction)confirmButtonClick:(id)sender;
- (void) onTimerTick;
- (void) updateTimeLeft;
- (void) setNewOperation;
- (void) appendNumber:(id)input;
- (void) deleteLastNumber;

@end
