//
//  SummaryViewController.h
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/20/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BButton.h"
#import "OperationList.h"

@interface SummaryViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *summaryResult;
@property (weak, nonatomic) IBOutlet UITextView *detailedResultLabel;
@property (weak, nonatomic) IBOutlet BButton *tryAgainButton;
@property (weak, nonatomic) IBOutlet BButton *settingsButton;
@property (readwrite) OperationList *operationList;

- (IBAction)tryAgainClick:(id)sender;
- (IBAction)settingsClick:(id)sender;


@end
