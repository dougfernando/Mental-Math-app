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
#import "MathHelper.h"
#import "TSMessage.h"

@interface CalculatorViewController ()
{
    NSNumber *currentNumber;
    UIProgressView *timeProgressBar;
    UILabel *timeLeftLabel;
}

@end

@implementation CalculatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    [self startSetup];
    
    [self configButtons];
    
    currentNumber = nil;
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
    [self.myConfirmButton setType:BButtonTypeSuccess];
}

-(void)startSetup {
    self.operationList = [[OperationList alloc] initWithFactory:[[RandomOperationFactory alloc] init]];
    [self setNewOperation];
    secondsLeft = 0;
    timeLeftLabel.text = [NSString stringWithFormat:@"%is", [ConfigHelper maxDuration]];
    [self progress:0 withMessage:@"Mental Math"];
    self.numOfQuestionsLabel.text = @"0";
    self.precisionLabel.text = @"100%";
    self.diffLabel.text = [ConfigHelper getLevelDescr];
    timeProgressBar.progress = 0;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(onTimerTick) userInfo:nil repeats:YES];
}

-(void)setNewOperation {
    Operation *currentOperation = [self.operationList currentOperation];
    // TODO change font size based on the operation length
    self.operationLabel.text = [currentOperation operationAsString];
    self.numOfQuestionsLabel.text = [NSString stringWithFormat:@"%i", [self.operationList size]];
    self.precisionLabel.text = [NSString stringWithFormat:@"%i%%", [self.operationList precision]];
    self.resultLabel.text = @"";
    self.myConfirmButton.enabled = true;
    currentNumber = nil;
}

- (void)progress:(int)progress withMessage:(NSString*)message {
    UIView* v = [[UIView alloc] init];
    v.frame = CGRectMake(0, 0, 200, 30);
    v.backgroundColor = [UIColor clearColor];
    
    UILabel* lbl = [[UILabel alloc] init];
    lbl.frame = CGRectMake(0,0, 200, 20);
    lbl.backgroundColor = [UIColor clearColor];
    lbl.textColor = [UIColor whiteColor];
    lbl.shadowColor = [UIColor colorWithWhite:0 alpha:0.3];
    lbl.shadowOffset = CGSizeMake(0, -1);
    lbl.font = [UIFont boldSystemFontOfSize:20];
    lbl.text = message;
    lbl.textAlignment = NSTextAlignmentCenter;
    [v addSubview:lbl];
    
    timeProgressBar = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    timeProgressBar.frame = CGRectMake(0, 36-timeProgressBar.frame.size.height, 185, timeProgressBar.frame.size.height);
    timeProgressBar.progress = progress/100.0;
    [v addSubview:timeProgressBar];
    
    timeLeftLabel = [[UILabel alloc] init];
    timeLeftLabel.frame = CGRectMake(182,33-timeProgressBar.frame.size.height, 40, 15);
    timeLeftLabel.backgroundColor = [UIColor clearColor];
    timeLeftLabel.textColor = [UIColor whiteColor];
    timeLeftLabel.shadowColor = [UIColor colorWithWhite:0 alpha:0.3];
    timeLeftLabel.shadowOffset = CGSizeMake(0, -1);
    timeLeftLabel.font = [UIFont boldSystemFontOfSize:12];
    timeLeftLabel.text = @"60s";
    timeLeftLabel.textAlignment = NSTextAlignmentCenter;
    [v addSubview:timeLeftLabel];

    
    self.navItem.titleView = v;
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
        timeLeftLabel.text = [NSString stringWithFormat:@"%is", [ConfigHelper maxDuration] - secondsLeft];
        float progress = (float)secondsLeft / [ConfigHelper maxDuration];
        timeProgressBar.progress = progress;
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
        self.operationList.practiceDatetime = [[NSDate alloc] init];
        [ConfigHelper saveOperationList:self.operationList];
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
    if (currentNumber == nil) {
        [TSMessage showNotificationInViewController:self
                                          withTitle:@"No data"
                                        withMessage:@"You should type a response before proceding..."
                                           withType:TSMessageNotificationTypeWarning
                                       withDuration:2.0];
    } else {
        currentOperation.result = [currentNumber floatValue];
	
        NSLog(@"%@", [currentOperation description]);
    
        [self.operationList nextOperation];
        [self setNewOperation];
    }
}

- (void)appendNumber:(id)input {
    NSString *current = currentNumber == nil? @"": [currentNumber stringValue];
    NSString *newValue = [current stringByAppendingString: input];
    currentNumber = [MathHelper asNumber:newValue];
    self.resultLabel.text = [MathHelper formatAsString:currentNumber];
}

- (void) deleteLastNumber {
    NSString *currentLabel = self.resultLabel.text;
    if ([currentLabel length] > 0) {
        NSString *current = [currentNumber stringValue];
        NSString *new = [current substringToIndex:[current length] - 1];
        if ([new isEqualToString:@""]) {
            currentNumber = nil;
        } else {
            currentNumber = [MathHelper asNumber:new];
        }
        self.resultLabel.text = [MathHelper formatAsString:currentNumber];
    }
}

@end
