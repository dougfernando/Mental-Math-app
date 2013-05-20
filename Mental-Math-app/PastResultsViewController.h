//
//  PastResultsViewController.h
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/28/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PastResultsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *clearButton;
- (IBAction)clearButtonCllick:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
-(IBAction)returnActionForSegue:(UIStoryboardSegue *)returnSegue;
@end
