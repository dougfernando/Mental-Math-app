//
//  OperationFactory.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/17/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "OperationFactory.h"
#import "ConfigHelper.h"
#import "LevelFactory.h"

@implementation OperationFactory

-(id)init {
    self = [super init];
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

-(Operation *)create {
    NSArray *operations = [ConfigHelper operationsToConsider];
    int position = arc4random() % [operations count];
    
	char operationChar = [[operations objectAtIndex:position] characterAtIndex:0];
    Operation *op = nil;
	OperatorsFactory *factory = [LevelFactory createOperatorsFactory];
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

