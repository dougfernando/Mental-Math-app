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
    if ([percOps count] == 0) return 0;
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

-(NSString *)macroScore {
    return nil;
}

@end
