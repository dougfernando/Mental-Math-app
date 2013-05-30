//
//  SummaryViewController.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/20/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "SummaryViewController.h"
#import "UIHelper.h"
#import "Social/Social.h"
#import "MathHelper.h"
#import "TSMessage.h"
#import "ViewOperationsViewController.h"
#import "CalculatorViewController.h"

@interface SummaryViewController ()

@end

@implementation SummaryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [UIHelper configBlueButton:self.tweetButton];
    [UIHelper configBlueButton:self.tryAgainButton];
    [UIHelper configBlueButton:self.analyzeButton];

    [UIHelper addBackground:self image:@"background.png" alpha:0.8];

    [self setResults];
}


- (void)setResults
{
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
    
    if (addTotal > 0) self.addPrecLabel.text = [NSString stringWithFormat:@"%i%%", [self.operationList addPrecision]];
    if (subTotal > 0) self.subPrecLabel.text = [NSString stringWithFormat:@"%i%%", [self.operationList subPrecision]];
    if (mulTotal > 0) self.mulPrecLabel.text = [NSString stringWithFormat:@"%i%%", [self.operationList multipPrecision]];
    if (divTotal > 0) self.divPrecLabel.text = [NSString stringWithFormat:@"%i%%", [self.operationList divPrecision]];
    if (percTotal > 0) self.perPrecLabel.text = [NSString stringWithFormat:@"%i%%", [self.operationList percPrecision]];
    if (total > 0) {
        int totalPrec = (int)((float)[self.operationList rightAnswers]*100/[self.operationList size]);
        self.totalPrecLabel.text = [NSString stringWithFormat:@"%i%%", totalPrec];
    }
    
    self.timeAddLabel.text = [NSString stringWithFormat:@"%@s", [MathHelper formatAsString:[self.operationList getAvgTimeAdd] precision:1]];
    self.timeSubLabel.text = [NSString stringWithFormat:@"%@s", [MathHelper formatAsString:[self.operationList getAvgTimeSub] precision:1]];
    self.timeMulLabel.text = [NSString stringWithFormat:@"%@s", [MathHelper formatAsString:[self.operationList getAvgTimeMul] precision:1]];
    self.timeDivLabel.text = [NSString stringWithFormat:@"%@s", [MathHelper formatAsString:[self.operationList getAvgTimeDiv] precision:1]];
    self.timePercLabel.text = [NSString stringWithFormat:@"%@s", [MathHelper formatAsString:[self.operationList getAvgTimePerc] precision:1]];
    self.timeTotalLabel.text = [NSString stringWithFormat:@"%@s", [MathHelper formatAsString:[self.operationList getAvgTimeTotal] precision:1]];
    
    
    
    NSNumber *score = [NSNumber numberWithFloat:[self.operationList globalScore]];
    self.summaryResult.text = [NSString stringWithFormat:@"%@%%", [MathHelper formatAsString:score precision:2]];
    
    self.navBar.topItem.title = [NSString stringWithFormat:@"Your result: %@", [self.operationList globalScoreRange]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tryAgainClick:(id)sender {
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"toOperationsSegue"]) {
        ViewOperationsViewController *vc = [segue destinationViewController];
        vc.operationList = self.operationList;
    }
}

- (IBAction)tweetResult:(id)sender {
    NSString *textObject = [NSString stringWithFormat:@"My score at Mental Math was %@. Try you too: %@", self.summaryResult.text, [NSURL URLWithString:@"www.google.com.br/search?q=mental+math"]];
    UIImage *image = [UIImage imageNamed:@"mental-math-icon.png"];
    NSArray *activityItems = [NSArray arrayWithObjects:textObject, [NSURL URLWithString:@"www.google.com.br/search?q=mental+math"], image, nil];
    
    UIActivityViewController *avc = [[UIActivityViewController alloc]
                                     initWithActivityItems:activityItems
                                     applicationActivities:nil];
    
    
    avc.completionHandler = ^(NSString *activityType, BOOL completed){
        NSLog(@"Activity Type selected: %@", activityType);
        if (completed) {
            NSLog(@"Selected activity was performed.");
        } else {
            if (activityType == NULL) {
                NSLog(@"User dismissed the view controller without making a selection.");
            } else {
                NSLog(@"Activity was not performed.");
            }
        }
    };
    
    avc.excludedActivityTypes = @[UIActivityTypePostToWeibo, UIActivityTypeAssignToContact, UIActivityTypePrint, UIActivityTypeCopyToPasteboard, UIActivityTypeSaveToCameraRoll, UIActivityTypePrint];
    
    [self presentViewController:avc animated:YES completion:nil];
}

- (IBAction)goBack:(id)sender {

}
@end
