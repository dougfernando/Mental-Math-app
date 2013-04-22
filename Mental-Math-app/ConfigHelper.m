//
//  ConfigHelper.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 19/4/2013.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "ConfigHelper.h"
#import "LevelFactory.h"

NSString *kSettingsLevelKey = @"kSettingsLevelKey";
NSString *kSettingsAddOpKey = @"kSettingsAddOpKey";
NSString *kSettingsSubOpKey = @"kSettingsSubOpKey";
NSString *kSettingsMultipOpKey = @"kSettingsMultipOpKey";
NSString *kSettingsDivOpKey = @"kSettingsDivOpKey";
NSString *kSettingsPercOpKey = @"kSettingsPercOpKey";
NSString *kSettingsTimeOpKey = @"kSettingsTimeOpKey";

@implementation ConfigHelper

+(int)maxDuration {
	return ([self getTime] + 1) * 20 ;
}

+(NSArray *)operationsToConsider {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    if ([self getaddOp]) [result addObject:@"+"];
    if ([self getSubOp]) [result addObject:@"-"];
    if ([self getMultipOp]) [result addObject:@"*"];
    if ([self getDivOp]) [result addObject:@"/"];
    if ([self getPercOp]) [result addObject:@"%"];
    return result;
}

+(void)saveLevel:(NSInteger)level {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:level forKey:kSettingsLevelKey];
}

+(NSInteger)getLevel {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger level = [defaults integerForKey:kSettingsLevelKey];
    return level;
}

+(void)saveTime:(NSInteger)time {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:time forKey:kSettingsTimeOpKey];
}

+(NSInteger)getTime {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger result = [defaults integerForKey:kSettingsTimeOpKey];
    return result;
}

+(void)saveAddOp:(BOOL)onOff {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:onOff forKey:kSettingsAddOpKey];
}

+(BOOL)getaddOp {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults objectForKey:kSettingsAddOpKey]) return true;
    NSInteger result= [defaults integerForKey:kSettingsAddOpKey];
    return result;
}

+(void)saveSubOp:(BOOL)onOff {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:onOff forKey:kSettingsSubOpKey];
}

+(BOOL)getSubOp {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults objectForKey:kSettingsSubOpKey]) return true;
    NSInteger result= [defaults integerForKey:kSettingsSubOpKey];
    return result;
}

+(void)saveMultipOp:(BOOL)onOff {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:onOff forKey:kSettingsMultipOpKey];
}

+(BOOL)getMultipOp {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults objectForKey:kSettingsMultipOpKey]) return true;

    NSInteger result= [defaults integerForKey:kSettingsMultipOpKey];
    return result;
}

+(void)saveDivOp:(BOOL)onOff {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:onOff forKey:kSettingsDivOpKey];
}

+(BOOL)getDivOp {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults objectForKey:kSettingsDivOpKey]) return true;

    NSInteger result= [defaults integerForKey:kSettingsDivOpKey];
    return result;
}

+(void)savePercOp:(BOOL)onOff {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:onOff forKey:kSettingsPercOpKey];
}

+(BOOL)getPercOp {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults objectForKey:kSettingsPercOpKey]) return true;

    NSInteger result= [defaults integerForKey:kSettingsPercOpKey];
    return result;
}


@end
