//
//  FirstViewController.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/16/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "FirstViewController.h"
#import "Operation.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNewOperation];
}

-(void)setNewOperation {
    self.currentOperation = [Operation createRandom];
    
    self.arg1Label.text = [self.currentOperation arg1AsString];
    self.arg2Label.text = [self.currentOperation arg2AsString];
    self.operatorLabel.text = [self.currentOperation operationAsString];
    self.resultLabel.text = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    if ([self.currentOperation isTheResult:typedResult]) {
        NSLog(@"OK");
    } else {
        NSLog(@"NOK");
    }
         
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
