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

@interface CalculatorViewController : UIViewController
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
@property (weak, nonatomic) IBOutlet UILabel *operationLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *restartButton;
@property (weak, nonatomic) IBOutlet BButton *myConfirmButton;
@property (readwrite) OperationList *operationList;
@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;
@property (weak, nonatomic) IBOutlet UINavigationItem *navItem;
@property (weak, nonatomic) IBOutlet UILabel *diffLabel;
@property (weak, nonatomic) IBOutlet UILabel *numOfQuestionsLabel;
@property (weak, nonatomic) IBOutlet UILabel *precisionLabel;

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

@end
