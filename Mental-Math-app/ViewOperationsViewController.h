//
//  ViewOperationsViewController.h
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 5/14/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OperationList.h"

@interface ViewOperationsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (readwrite) OperationList *operationList;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
