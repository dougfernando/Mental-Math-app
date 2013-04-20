//
//  FirstViewController.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/16/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "FirstViewController.h"
#import "Operation.h"
#import "OperationFactory.h"
#import "ConfigHelper.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    [self startSetup];
    
    [self configButtons];
 }

-(void)configButtons {
    UIColor *color = [UIColor colorWithRed:0.00f green:0.33f blue:0.80f alpha:1.00f];
    NSArray  *buttons = [NSArray arrayWithObjects: self.button1, self.button2, self.button3,
                        self.button4, self.button5, self.button6, self.button7,
                        self.button8, self.button9, self.button0, self.button000, self.buttonDel,
                         nil ];
    for (BButton *button in buttons) {
        button.color = color;
    }
    self.myConfirmButton.color = [UIColor colorWithRed:0.32f green:0.64f blue:0.32f alpha:1.00f];
}

-(void)startSetup {
    self.operationList = [[OperationList alloc] initWithFactory:[[RandomOperationFactory alloc] init]];
    [self setNewOperation];
    secondsLeft = 0;
    self.timeLeftLabel.text = [NSString stringWithFormat:@"%is", [ConfigHelper maxDuration]];
    self.timeProgressBar.progress = 0;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(onTimerTick) userInfo:nil repeats:YES];
}

-(void)setNewOperation {
    Operation *currentOperation = [self.operationList currentOperation];
    self.arg1Label.text = [currentOperation arg1AsString];
    self.arg2Label.text = [currentOperation arg2AsString];
    self.operatorLabel.text = [currentOperation operationAsString];
    self.resultLabel.text = @"";
    self.scoreLabel.text = [self.operationList scoreAsString];
    self.myConfirmButton.enabled = true;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    if (timer != nil) {
        [timer invalidate];   
    }
}

-(void)onTimerTick {
    [self updateTimeLeft];
}

-(void)updateTimeLeft {
    if (secondsLeft < [ConfigHelper maxDuration]) {
        secondsLeft++;
        self.timeLeftLabel.text = [NSString stringWithFormat:@"%is", [ConfigHelper maxDuration] - secondsLeft];
        float progress = (float)secondsLeft / [ConfigHelper maxDuration];
        self.timeProgressBar.progress = progress;
    } else {
        self.myConfirmButton.enabled = false;
        [timer invalidate];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result"
                                                        message:@"Time is up"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

-(IBAction)doSomething:(id)sender {
    //code for doing what you want your button to do.
}

- (IBAction)button1Click:(id)sender {
    [self appendNumber: @"1"];
}

- (IBAction)button2Click:(id)sender {
    [self appendNumber: @"2"];
}

- (IBAction)button3Click:(id)sender {
    [self appendNumber: @"3"];
}

- (IBAction)button4Click:(id)sender {
    [self appendNumber: @"4"];
}

- (IBAction)button5Click:(id)sender {
    [self appendNumber: @"5"];
}

- (IBAction)button6Click:(id)sender {
    [self appendNumber: @"6"];
}

- (IBAction)button7Click:(id)sender {
    [self appendNumber: @"7"];
}

- (IBAction)button8Click:(id)sender {
    [self appendNumber: @"8"];
}

- (IBAction)button9Click:(id)sender {
    [self appendNumber: @"9"];
}

- (IBAction)button0Click:(id)sender {
    [self appendNumber: @"0"];
}

- (IBAction)button000Click:(id)sender {
    [self appendNumber: @"000"];
}

- (IBAction)buttonDelClick:(id)sender {
    [self deleteLastNumber];
}

- (IBAction)restartClick:(id)sender {
    [timer invalidate];
    [self startSetup];
}

- (IBAction)confirmButtonClick:(id)sender {
    Operation *currentOperation = [self.operationList currentOperation];
    float typedResult = [self.resultLabel.text floatValue];
	currentOperation.result = typedResult;
	
    NSLog(@"%@", [currentOperation description]);
    
    [self.operationList nextOperation];
    [self setNewOperation];
}

- (void)appendNumber:(id)input {
    NSString *current = self.resultLabel.text;
    NSString *new = [current stringByAppendingString: input];
    self.resultLabel.text = new;
}

- (void) deleteLastNumber {
    NSString *current = self.resultLabel.text;
    if ([current length] > 0) {
        NSString *new = [current substringToIndex:[current length] - 1];
        self.resultLabel.text = new;
    }
}

@end
