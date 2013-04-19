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

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.operationList = [[OperationList alloc] initWithFactory:[[RandomOperationFactory alloc] init]];
    [self setNewOperation];
    
    secondsLeft = 0;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(onTimerTick) userInfo:nil repeats:YES];
    self.timeLeftLabel.text = @"60s";    
 }

-(void)setNewOperation {
    Operation *currentOperation = [self.operationList currentOperation];
    self.arg1Label.text = [currentOperation arg1AsString];
    self.arg2Label.text = [currentOperation arg2AsString];
    self.operatorLabel.text = [currentOperation operationAsString];
    self.resultLabel.text = @"";
    self.scoreLabel.text = [self.operationList scoreAsString];
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
    if (secondsLeft < 60) {
        secondsLeft++;
        self.timeLeftLabel.text = [NSString stringWithFormat:@"%is", 60 - secondsLeft];
    } else {
        [timer invalidate];        
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

- (IBAction)buttonDotClick:(id)sender {
    [self appendNumber: @","];
}

- (IBAction)buttonDelClick:(id)sender {
    [self deleteLastNumber];
}

- (IBAction)buttonConfirmClick:(id)sender {
    float typedResult = [self.resultLabel.text floatValue];
    Operation *currentOperation = [self.operationList currentOperation];

    if ([currentOperation isTheResult:typedResult]) {
        NSLog(@"OK");
    } else {
        NSLog(@"NOK");
    }
    
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
