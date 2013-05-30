//
//  PastResultsViewController.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/28/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "PastResultsViewController.h"
#import "OperationList.h"
#import "ConfigHelper.h"
#import "SummaryViewController.h"
#import "MathHelper.h"

@interface PastResultsViewController ()
{
    NSArray *pastResults;
    __weak IBOutlet UINavigationBar *navBar;
}
@end

@implementation PastResultsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    pastResults = [ConfigHelper getAllOperationLists];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [super viewWillAppear:YES];
    
    [self.tableView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    self.tableView.backgroundView = nil;
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
    return [pastResults count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    OperationList *list = [pastResults objectAtIndex:indexPath.row];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd 'at' HH:mm"];
    cell.textLabel.text = [dateFormatter stringFromDate:list.practiceDatetime];
    
    NSNumber *score = [NSNumber numberWithFloat:[list globalScore]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@%%", [MathHelper formatAsString:score precision:2]];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"toSummarySegue"]) {
        SummaryViewController *vc = [segue destinationViewController];
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        OperationList *selectedOperation = [pastResults objectAtIndex:path.row];
        vc.operationList = selectedOperation;
    }
}

- (IBAction)clearButtonCllick:(id)sender {
    UIActionSheet *popupQuery = [[UIActionSheet alloc] initWithTitle:@"Clear results history?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Clear all" otherButtonTitles:nil];
    popupQuery.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [popupQuery showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            [ConfigHelper clearOperationLists];
            [self performSegueWithIdentifier:@"toMainViewSegue" sender:self];
            break;
        case 1:
            NSLog(@"Delete was cancelled by the user");
            break;
    }
}

-(IBAction)returnActionForSegue:(UIStoryboardSegue *)returnSegue {
}

@end
