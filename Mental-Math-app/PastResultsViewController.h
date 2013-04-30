//
//  PastResultsViewController.h
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/28/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PastResultsViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *clearButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
- (IBAction)clearButtonCllick:(id)sender;

@end
