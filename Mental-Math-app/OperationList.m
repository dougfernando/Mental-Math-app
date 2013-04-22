//
//  OperationList.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/17/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "OperationList.h"
#import "OperationFactory.h"
#import <OCTotallyLazy/OCTotallyLazy.h>

@implementation OperationList

-(id)initWithFactory:(OperationFactory *)factory {
    if (self = [super init]) {
        _pastOperations = [[NSMutableArray alloc] init];
		_factory = factory;
		_currentOperation = [factory create];
    }
    	
    return self;
}

-(Operation *)currentOperation {
	return _currentOperation;
}

-(Operation *)nextOperation {
	[_pastOperations addObject:_currentOperation];
	_currentOperation = [_factory create];
	return _currentOperation;
}

-(int)size {
    return [_pastOperations count];
}

-(int)rightAnswers {
    NSArray *result = [_pastOperations filter:^BOOL(Operation *op) {
        return [op isCorrect];
    }];
    
    return [result count];
}

-(NSString *)scoreAsString {
    int percentage = (int)((float)[self rightAnswers] * 100 / [self size]);
    percentage = percentage < 0? 0: percentage;
    return [NSString stringWithFormat:@"%i/%i - %i%%", [self rightAnswers], [self size], percentage];
}

-(NSArray *)getRightOperations:(NSArray *)input {
    return [input filter:^BOOL(Operation *op) {
        return [op isCorrect];
    }];
}

-(NSArray *)getOperationsBySymbol:(NSString *)operationSymbol {
    return [_pastOperations filter:^BOOL(Operation *op) {
        return [[op operationAsString] isEqualToString:operationSymbol];
    }];
}


-(NSString *)detailedResult {
    NSArray *addOps = [self getOperationsBySymbol:@"+"];
    NSArray *rightAddOps = [self getRightOperations:addOps];

    NSArray *subOps = [self getOperationsBySymbol:@"-"];
    NSArray *rightSubOps = [self getRightOperations:subOps];

    NSArray *multipOps = [self getOperationsBySymbol:@"*"];
    NSArray *rightMultipOps = [self getRightOperations:multipOps];

    NSArray *divOps = [self getOperationsBySymbol:@"/"];
    NSArray *rightDivOps = [self getRightOperations:divOps];

    NSArray *percOps = [self getOperationsBySymbol:@"+"];
    NSArray *rightPercOps = [self getRightOperations:percOps];
    
    NSArray *rightOps = [self getRightOperations:_pastOperations];

    return [NSString stringWithFormat:
            @"Operation  Right  Wrong  Total\n"
            "-------------------------------\n"
            "ADD         %i        %i     %i \n"
            "SUB         %i        %i     %i \n"
            "MULTIP      %i        %i     %i \n"
            "DIV         %i        %i     %i \n"
            "PERC        %i        %i     %i \n"
            "-------------------------------\n"
            "TOTAL       %i        %i     %i \n",
            [rightAddOps count], ([addOps count] - [rightAddOps count]), [addOps count],
            [rightSubOps count], ([subOps count] - [rightSubOps count]), [subOps count],
            [rightMultipOps count], ([multipOps count] - [rightMultipOps count]), [multipOps count],
            [rightDivOps count], ([divOps count] - [rightDivOps count]), [divOps count],
            [rightPercOps count], ([percOps count] - [rightPercOps count]), [percOps count],
            [rightOps count], ([_pastOperations count] - [rightOps count]), [_pastOperations count]
    ];
}

-(NSString *)macroScore {
    return nil;
}

@end
