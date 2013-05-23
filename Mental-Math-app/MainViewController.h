//
//  SecondViewController.h
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/16/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "FUIButton.h"
#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>

@interface MainViewController : UIViewController<GKGameCenterControllerDelegate>

@property (weak, nonatomic) IBOutlet FUIButton *runButton;
@property (weak, nonatomic) IBOutlet FUIButton *settingsButton;
@property (weak, nonatomic) IBOutlet FUIButton *pastResultsButton;
@property (weak, nonatomic) IBOutlet FUIButton *leaderboardButton;
- (IBAction)showBoard:(id)sender;
- (IBAction)addScore:(id)sender;

-(IBAction)returnActionForSegue:(UIStoryboardSegue *)returnSegue;
@end

