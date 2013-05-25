//
//  GameCenterHelper.h
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 5/22/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameCenterHelper : NSObject
+(void)reportScore: (int16_t) score;
+(void)authenticateOnGameCenter: (void (^)(void)) block;
+(BOOL)isAuthenticated;
@end
