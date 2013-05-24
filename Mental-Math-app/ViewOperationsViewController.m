//
//  ViewOperationsViewController.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 5/14/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "ViewOperationsViewController.h"
#import "SummaryViewController.h"
#import "MathHelper.h"
#import "OperationTableCell.h"

@interface ViewOperationsViewController ()

@end

@implementation ViewOperationsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [super viewWillAppear:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.operationList size];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    OperationTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Operation *operation = [self.operationList operationAt:indexPath.row];
    cell.operationLabel.text = [operation operationDescription];
    cell.rightAnswerLabel.text = [NSString stringWithFormat:@"Right: %@",
                                 [MathHelper formatAsString: [NSNumber numberWithFloat:[operation execute]]]];
    cell.resultLabel.text = [operation isCorrect] ? @"right" : @"wrong";
    cell.resultLabel.textColor =
        [operation isCorrect] ?
            [UIColor colorWithRed:0.15 green:0.31 blue:0.07 alpha:1.0] :
            [UIColor colorWithRed:0.36 green:0.06 blue:0.00 alpha:1.0];
    cell.durationLabel.text = [NSString stringWithFormat:@"%@s", [MathHelper formatAsString:[operation durationInSeconds] precision:1]];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"goBackSegue"]) {
        SummaryViewController *vc = [segue destinationViewController];
        vc.operationList = self.operationList;
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

@end
