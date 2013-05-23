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

@implementation MainViewController

- (void)authenticateOnGameCenter
{
    GKLocalPlayer *player = [GKLocalPlayer localPlayer];
    __weak GKLocalPlayer *blockLocalPlayer = player;
    
    player.authenticateHandler = ^(UIViewController *viewController, NSError *error){
        if (blockLocalPlayer.isAuthenticated) {
            NSLog(@"Game Center Authenticated");
        } else {
            NSLog(@"Game Center Disabled");
        }
        
        if (error) NSLog(@"Error authenticating Game Center: %@", error);
    };
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [UIHelper addBackground:self image:@"main-background.png"];
    [UIHelper configGreenButton:self.runButton];
    [UIHelper configBlueButton:self.settingsButton];
    [UIHelper configBlueButton:self.pastResultsButton];
    [UIHelper configBlueButton:self.leaderboardButton];
    [self authenticateOnGameCenter];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)showBoard:(id)sender {
    NSString *leaderboardID = kLeaderboardID;
    
    GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] init];
    if (gameCenterController != nil)
    {
        gameCenterController.gameCenterDelegate = self;
        gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
        gameCenterController.leaderboardTimeScope = GKLeaderboardTimeScopeAllTime;
        gameCenterController.leaderboardCategory = leaderboardID;
        [self presentViewController: gameCenterController animated: YES completion:nil];
    }
}

// For testing only
- (IBAction)addScore:(id)sender {
    int64_t score = 1.4 * 100;
    GKScore *scoreReporter = [[GKScore alloc] initWithCategory:kLeaderboardID];
    scoreReporter.value = score;

    NSLog(@"A");
    scoreReporter.context = 0;

        NSLog(@"B");
    
    [scoreReporter reportScoreWithCompletionHandler:^(NSError *error) {
        NSLog(@"Error reporting score: %@",[error localizedDescription]);
    }];
}

-(IBAction)returnActionForSegue:(UIStoryboardSegue *)returnSegue {
    
    // do useful actions here.
    
}

-(void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
