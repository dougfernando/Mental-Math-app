//
//  SecondViewController.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/16/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "MainViewController.h"
#import "UIHelper.h"
#import "UIColor+FlatUI.h"
#import "GameCenterHelper.h"

@interface MainViewController ()
@end

/*
 * Main interface in which the users select the funcionalities available
 */
@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [UIHelper addBackground:self image:@"main-background.png"];
    [UIHelper configGreenButton:self.runButton];
    [UIHelper configBlueButton:self.settingsButton];
    [UIHelper configBlueButton:self.pastResultsButton];
    [UIHelper configBlueButton:self.leaderboardButton];
    if (![GameCenterHelper isAuthenticated]) {
        self.leaderboardButton.enabled = FALSE;
        [GameCenterHelper authenticateOnGameCenter: ^{
            self.leaderboardButton.enabled = TRUE;
        }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
#pragma mark - Table view data source
- (IBAction)showBoard:(id)sender {
    GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] init];
    if (gameCenterController != nil)
    {
        gameCenterController.gameCenterDelegate = self;
        gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
        gameCenterController.leaderboardTimeScope = GKLeaderboardTimeScopeAllTime;
        [self presentViewController: gameCenterController animated: YES completion:nil];
    }
}

-(void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
 * Just to enable using the "Exit" functionality of Storyboard
 */
-(IBAction)returnActionForSegue:(UIStoryboardSegue *)returnSegue {
}

@end
