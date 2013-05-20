//
//  SummaryViewController.h
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/20/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OperationList.h"
#import "FUIButton.h"

@interface SummaryViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *summaryResult;
@property (weak, nonatomic) IBOutlet FUIButton *tryAgainButton;
@property (weak, nonatomic) IBOutlet FUIButton *tweetButton;
@property (weak, nonatomic) IBOutlet FUIButton *analyzeButton;

@property (readwrite) OperationList *operationList;
@property (weak, nonatomic) IBOutlet UILabel *subPrecLabel;
@property (weak, nonatomic) IBOutlet UILabel *addPrecLabel;
@property (weak, nonatomic) IBOutlet UILabel *mulPrecLabel;
@property (weak, nonatomic) IBOutlet UILabel *divPrecLabel;
@property (weak, nonatomic) IBOutlet UILabel *perPrecLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalPrecLabel;
@property (weak, nonatomic) IBOutlet UILabel *numAddLabel;
@property (weak, nonatomic) IBOutlet UILabel *numSubLabel;
@property (weak, nonatomic) IBOutlet UILabel *numMulLabel;
@property (weak, nonatomic) IBOutlet UILabel *numDivLabel;
@property (weak, nonatomic) IBOutlet UILabel *numPercLabel;
@property (weak, nonatomic) IBOutlet UILabel *numTotalLabel;
@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;

- (IBAction)tryAgainClick:(id)sender;
- (IBAction)tweetResult:(id)sender;
- (IBAction)goBack:(id)sender;


@end
