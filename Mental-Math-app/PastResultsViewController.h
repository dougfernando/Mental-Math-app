//
//  PastResultsViewController.h
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/28/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PastResultsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *clearButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

-(IBAction)clearButtonCllick:(id)sender;
-(IBAction)returnActionForSegue:(UIStoryboardSegue *)returnSegue;
@end
