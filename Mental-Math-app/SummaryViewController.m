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
    [self.tryAgainButton setType:BButtonTypeSuccess];
    [self.mainButton setType:BButtonTypeWarning];
    [self.tweetButton setType:BButtonTypeTwitter];
    [self.facebookButton setType:BButtonTypeFacebook];
    
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
    
    NSNumber *score = [NSNumber numberWithFloat:[self.operationList globalScore]];
    self.summaryResult.text = [NSString stringWithFormat:@"%@%%", [MathHelper formatAsString:score precision:2]];
    
    self.phraseResultLabel.text = [self.operationList globalScoreRange];
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
        ViewOperationsViewController *vc = [[[segue destinationViewController] viewControllers] objectAtIndex:0];
        vc.operationList = self.operationList;
    }
}

-(SLComposeViewControllerCompletionHandler)getBlock:(SLComposeViewController *)controller {
    SLComposeViewControllerCompletionHandler myBlock = ^(SLComposeViewControllerResult result) {
        if (result == SLComposeViewControllerResultCancelled) {
            NSLog(@"Cancelled");
        } else {
            NSLog(@"Done");
        }
        
        [controller dismissViewControllerAnimated:YES completion:Nil];
    };
    
    return myBlock;
}

- (IBAction)postToFacebook:(id)sender {
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        controller.completionHandler = [self getBlock:controller];
        [controller setInitialText:[NSString stringWithFormat:@"My score at Mental Math was %@. Try you too: ", self.summaryResult.text]];
        [controller addURL:[NSURL URLWithString:@"www.google.com.br/search?q=mental+math"]];
        [controller addImage:[UIImage imageNamed:@"mental-math-icon.png"]];
        [self presentViewController:controller animated:YES completion:Nil];
        
    } else {
        NSLog(@"UnAvailable");
        [TSMessage showNotificationInViewController:self
                                          withTitle:@"Facebook not configured"
                                        withMessage:@"You must first configure you Facebook account (iPhone Settings)..."
                                           withType:TSMessageNotificationTypeWarning
                                       withDuration:2.0];

    }
}

- (IBAction)tweetResult:(id)sender {
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        controller.completionHandler = [self getBlock:controller];
        [controller setInitialText:[NSString stringWithFormat:@"My score at Mental Math was %@. Try you too: %@", self.summaryResult.text, @"www.google.com.br/search?q=mental+math"]];
        [controller addImage:[UIImage imageNamed:@"mental-math-icon.png"]];
        
        [self presentViewController:controller animated:YES completion:Nil];
        
    } else {
        NSLog(@"UnAvailable");
        [TSMessage showNotificationInViewController:self
                                          withTitle:@"Twitter not configured"
                                        withMessage:@"You must first configure you Twitter account (iPhone Settings)..."
                                           withType:TSMessageNotificationTypeWarning
                                       withDuration:2.0];
    }
}
@end
