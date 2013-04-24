//
//  FirstViewController.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/16/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "CalculatorViewController.h"
#import "Operation.h"
#import "OperationFactory.h"
#import "ConfigHelper.h"
#import "SummaryViewController.h"
#import "UIHelper.h"

@interface CalculatorViewController ()
{
    NSNumberFormatter *formatter;
    NSNumber *currentNumber;
}

@end

@implementation CalculatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    [self startSetup];
    
    [self configButtons];
    
    formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    [UIHelper addBackground:self];
 }

-(void)configButtons {
    UIColor *color = [UIHelper getBlueButtonColor];
    NSArray  *buttons = [NSArray arrayWithObjects: self.button1, self.button2, self.button3,
                        self.button4, self.button5, self.button6, self.button7,
                        self.button8, self.button9, self.button0, self.button000, self.buttonDel,
                         nil ];
    for (BButton *button in buttons) {
        button.color = color;
    }
    //green
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
    currentNumber = nil;
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
                
        [self performSegueWithIdentifier:@"toSummarySegue" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"toSummarySegue"]) {
        SummaryViewController *vc = [segue destinationViewController];
        vc.operationList = self.operationList;
    }
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
	currentOperation.result = [currentNumber floatValue];
	
    NSLog(@"%@", [currentOperation description]);
    
    [self.operationList nextOperation];
    [self setNewOperation];
}

- (void)appendNumber:(id)input {
    NSString *current = currentNumber == nil? @"": [currentNumber stringValue];
    NSString *newValue = [current stringByAppendingString: input];
    currentNumber = [formatter numberFromString:newValue];
    self.resultLabel.text = [formatter stringFromNumber:currentNumber];
}

- (void) deleteLastNumber {
    NSString *current = self.resultLabel.text;
    if ([current length] > 0) {
        NSString *new = [current substringToIndex:[current length] - 1];
        self.resultLabel.text = new;
    }
}

@end
