//
//  GameCenterHelper.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 5/22/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "GameCenterHelper.h"
#import <GameKit/GameKit.h>
#import "ConfigHelper.h"
#import "AppDelegate.h"

@implementation GameCenterHelper
NSString *const kLeaderboardID_Easy = @"Mental_Math_Score";
NSString *const kLeaderboardID_Medium = @"Mental_Math_Score_2";
NSString *const kLeaderboardID_Hard = @"Mental_Math_Score_3";

+(void)reportScore: (int16_t) score
{
    GKScore *scoreReporter = [[GKScore alloc] initWithCategory:[self getLeaderboardID]];
    scoreReporter.value = score * 100;
    scoreReporter.context = 0;
    
    [scoreReporter reportScoreWithCompletionHandler:^(NSError *error) {
        NSLog(@"Error reporting score: %@",[error localizedDescription]);
    }];
}

+(NSString *)getLeaderboardID {
    int level = [ConfigHelper getLevel];
    switch (level) {
        case 0:
            return kLeaderboardID_Easy;
            break;
        case 1:
            return kLeaderboardID_Medium;
        case 2:
        default:
            return kLeaderboardID_Hard;
            break;
    }
}

+(void)authenticateOnGameCenter: (void (^)(void)) block forViewController:(UIViewController *) aViewController
{
    GKLocalPlayer *player = [GKLocalPlayer localPlayer];
    __weak GKLocalPlayer *blockLocalPlayer = player;
    
    player.authenticateHandler = ^(UIViewController *viewController, NSError *error){
        if (viewController != nil) {
        }
        if (blockLocalPlayer.isAuthenticated) {
            NSLog(@"Game Center Authenticated");
            block();
        } else {
            NSLog(@"Game Center Disabled");
        }
        
        if (error) NSLog(@"Error authenticating Game Center: %@", error);
    };
}

+(BOOL)isAuthenticated {
    BOOL result = [[GKLocalPlayer localPlayer] isAuthenticated];
    return result;
}

@end
