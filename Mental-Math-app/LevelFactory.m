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
	return [[MediumOperatorsFactory alloc] init];
}

@end
