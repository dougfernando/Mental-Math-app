//
//  ConfigHelper.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 19/4/2013.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "ConfigHelper.h"

@implementation ConfigHelper

+(int)maxDuration {
	return 60;
}

+(NSArray *)operationsToConsider {
    NSArray  *result = [NSArray arrayWithObjects:@"+",@"-",@"*", @"/", @"%", nil];
    return result;
}

@end
