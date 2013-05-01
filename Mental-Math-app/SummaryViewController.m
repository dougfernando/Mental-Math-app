//
//  SummaryViewController.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/20/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "SummaryViewController.h"
#import "UIHelper.h"

@interface SummaryViewController ()

@end

@implementation SummaryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.settingsButton.color = [UIHelper getBlueButtonColor];;
    [self.tryAgainButton setType:BButtonTypeSuccess];

    int addTotal = [self.operationList addTotal];
    self.numAddLabel.text = [NSString stringWithFormat:@"%i", addTotal];
    int subTotal = [self.operationList subTotal];
    self.numSubLabel.text = [NSString stringWithFormat:@"%i", subTotal];
    int mulTotal = [self.operationList multipTotal];
    self.numMulLabel.text = [NSString stringWithFormat:@"%i", mulTotal];
    int divTotal = [self.operationList divTotal];
    self.numDivLabel.text = [NSString stringWithFormat:@"%i", divTotal];
    int percTotal = [self.operationList percTotal];
    self.numPercLabel.text = [NSString stringWithFormat:@"%i", percTotal];
    int total = [self.operationList size];
    self.numTotalLabel.text = [NSString stringWithFormat:@"%i", total];
    
    if (addTotal > 0)
        self.addPrecLabel.text = [NSString stringWithFormat:@"%i%%", [self.operationList addPrecision]];
    if (subTotal > 0)
        self.subPrecLabel.text = [NSString stringWithFormat:@"%i%%", [self.operationList subPrecision]];
    if (mulTotal > 0)
        self.mulPrecLabel.text = [NSString stringWithFormat:@"%i%%", [self.operationList multipPrecision]];
    if (divTotal > 0)
        self.divPrecLabel.text = [NSString stringWithFormat:@"%i%%", [self.operationList divPrecision]];
    if (percTotal > 0)
        self.perPrecLabel.text = [NSString stringWithFormat:@"%i%%", [self.operationList percPrecision]];
    if (total > 0) {
        int totalPrec = (int)((float)[self.operationList rightAnswers]*100/[self.operationList size]);
        self.totalPrecLabel.text = [NSString stringWithFormat:@"%i%%", totalPrec];
    }
    
    self.summaryResult.text = [NSString stringWithFormat:@"%.02f", [self.operationList globalScore]];

    self.phraseResultLabel.text = [self.operationList globalScoreRange];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tryAgainClick:(id)sender {
}

- (IBAction)settingsClick:(id)sender {
}
@end
