//
//  OperationList.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/17/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "OperationList.h"
#import "OperationFactory.h"
#import "ConfigHelper.h"
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

-(int)precision {
    return (float)[self rightAnswers]/[self size] * 100;
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

-(int)getPrecision: (NSString *)input {
    NSArray *percOps = [self getOperationsBySymbol:input];
    if ([percOps count] == 0) return -1;
    NSArray *rightOps = [self getRightOperations:percOps];
    return (int)((float)[rightOps count]*100/[percOps count]);
}

-(int)addPrecision {
    return [self getPrecision:@"+"];
}

-(int)addTotal {
    return  [[self getOperationsBySymbol:@"+"] count];
}
-(int)subPrecision {
    return [self getPrecision:@"-"];

}
-(int)subTotal {
    return  [[self getOperationsBySymbol:@"-"] count];
}
-(int)multipPrecision {
    return [self getPrecision:@"*"];
}
-(int)multipTotal {
    return  [[self getOperationsBySymbol:@"*"] count];
}
-(int)divPrecision {
    return [self getPrecision:@"/"];
}
-(int)divTotal {
    return  [[self getOperationsBySymbol:@"/"] count];
};
-(int)percPrecision {
    return [self getPrecision:@"%"];
}
-(int)percTotal {
    return  [[self getOperationsBySymbol:@"%"] count];
}
-(float)globalScore {
    int level = [ConfigHelper getLevel];
    int minutes = [ConfigHelper maxDuration] / 60;
    int factor = 0;
    switch (level) {
        case 0:
            factor = 50;
            break;
        case 1:
            factor = 35;
            break;
        case 2:
            factor = 20;
            break;
        default:
            break;
    }
    
    float rightness = (float)[self rightAnswers] / [self size];

    float total = (float)[self size] / (factor * minutes);
    
    if (rightness < 0.5)
        return total * rightness + rightness * (1 - rightness);

    return(total * 0.5 + rightness * 0.5);
}

-(NSString *)globalScoreRange {
    if ([self globalScore] < 0.5)
        return @"Not good!";
    else if ([self globalScore] < 0.7)
        return @"Good!";
    return @"Great!";
}

@end
