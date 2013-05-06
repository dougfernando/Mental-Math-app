//
//  OperationFactory.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/17/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "OperationFactory.h"
#import "ConfigHelper.h"

@implementation OperationFactory

-(id)init {
    self = [super init];
    
    self.practiceLevel = [ConfigHelper getLevel];
    self.maxTimeInSeconds = [ConfigHelper maxDuration];
    
    return self;
}

-(Operation *)create {
    return nil;
}

@end

@implementation RandomOperationFactory

-(id)init {
    self = [super init];
    return self;
}

-(OperatorsFactory *)createOperatorsFactory {
    NSInteger level = self.practiceLevel;
    
    if (level == 0) {
       	return [[EasyOperatorsFactory alloc] init];
    } else if (level == 1) {
       	return [[MediumOperatorsFactory alloc] init];
    }
    
	return [[HardOperatorsFactory alloc] init];
}

-(Operation *)create {
    NSArray *operations = [ConfigHelper operationsToConsider];
    int position = arc4random() % [operations count];
    
	char operationChar = [[operations objectAtIndex:position] characterAtIndex:0];
    Operation *op = nil;
	OperatorsFactory *factory = [self createOperatorsFactory];
    switch (operationChar) {
        case '+':
            op = [[PlusOperation alloc] initWithPair:[factory createPairForAdd]];
            break;
        case '-':
            op = [[MinusOperation alloc] initWithPair:[factory createPairForSub]];
            break;
        case '*':
            op = [[MultipOperation alloc] initWithPair:[factory createPairForMultip]];
            break;
        case '/':
            op = [[DivOperation alloc] initWithPair:[factory createPairForDiv]];
            break;
        case '%':
            op = [[PercOperation alloc] initWithPair:[factory createPairForPerc]];
            break;
        default:
            op = nil;
            break;
    }
    return op;
}
@end

