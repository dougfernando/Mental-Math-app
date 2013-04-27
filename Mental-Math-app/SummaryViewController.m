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
    UIColor *color = [UIHelper getBlueButtonColor];;

    self.tryAgainButton.color = color;
    self.settingsButton.color = color;
    self.addPrecLabel.text = [NSString stringWithFormat:@"%i%%", [self.operationList addPrecision]];
    self.subPrecLabel.text = [NSString stringWithFormat:@"%i%%", [self.operationList subPrecision]];
    self.mulPrecLabel.text = [NSString stringWithFormat:@"%i%%", [self.operationList multipPrecision]];
    self.divPrecLabel.text = [NSString stringWithFormat:@"%i%%", [self.operationList divPrecision]];
    self.perPrecLabel.text = [NSString stringWithFormat:@"%i%%", [self.operationList percPrecision]];
    int totalPrec = (int)((float)[self.operationList rightAnswers]*100/[self.operationList size]);
    self.totalPrecLabel.text = [NSString stringWithFormat:@"%i%%", totalPrec];
    

    self.numAddLabel.text = [NSString stringWithFormat:@"%i", [self.operationList addTotal]];
    self.numSubLabel.text = [NSString stringWithFormat:@"%i", [self.operationList subTotal]];
    self.numMulLabel.text = [NSString stringWithFormat:@"%i", [self.operationList multipTotal]];
    self.numDivLabel.text = [NSString stringWithFormat:@"%i", [self.operationList divTotal]];
    self.numPercLabel.text = [NSString stringWithFormat:@"%i", [self.operationList percTotal]];
    self.numTotalLabel.text = [NSString stringWithFormat:@"%i", [self.operationList size]];
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
