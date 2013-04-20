//
//  LevelFactory.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/19/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "LevelFactory.h"
#import "OperatorsFactory.h"
#import "OperationFactory.h"

@implementation LevelFactory

+(OperatorsFactory *)createOperatorsFactory {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger level = [defaults integerForKey:kSettingsLevelKey];
    
    if (level == 0) {
       	return [[EasyOperatorsFactory alloc] init];
    } else if (level == 1) {
       	return [[MediumOperatorsFactory alloc] init];
    }

	return [[HardOperatorsFactory alloc] init];
}

NSString *kSettingsLevelKey = @"kSettingsLevelKey";
NSString *kSettingsAddOpKey = @"kSettingsAddOpKey";
NSString *kSettingsSubOpKey = @"kSettingsSubOpKey";
NSString *kSettingsMultipOpKey = @"kSettingsMultipOpKey";
NSString *kSettingsDivOpKey = @"kSettingsDivOpKey";
NSString *kSettingsPercOpKey = @"kSettingsPercOpKey";
NSString *kSettingsTimeOpKey = @"kSettingsTimeOpKey";

@end

