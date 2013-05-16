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
        _currentOperation.startTime = [NSDate date];
        _practiceLevel = _factory.practiceLevel;
        _timeInSeconds = _factory.maxTimeInSeconds;
    }
    	
    return self;
}

-(Operation *)currentOperation {
	return _currentOperation;
}

-(Operation *)nextOperation {
    _currentOperation.endTime = [NSDate date];
	[_pastOperations addObject:_currentOperation];
	_currentOperation = [_factory create];
    _currentOperation.startTime = [NSDate date];
	return _currentOperation;
}

-(int)size {
    return [_pastOperations count];
}

-(Operation *)operationAt:(NSUInteger)index {
    return [_pastOperations objectAtIndex:index];
}

-(int)rightAnswers {
    NSArray *result = [_pastOperations filter:^BOOL(Operation *op) {
        return [op isCorrect];
    }];
    
    return result == nil? 0 : [result count];
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
        BOOL result = [[op operatorAsString] isEqualToString:operationSymbol];
        return result;
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
    int level = _practiceLevel;
    int minutes = _timeInSeconds / 60;
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
    
    int numOfQuestionsExptected = factor * minutes;
    float qtyFactor = 1 - (float)(numOfQuestionsExptected - [self size]) / numOfQuestionsExptected;
    float scorePrecition = [self precision];
    return qtyFactor * scorePrecition;
}

-(NSString *)globalScoreRange {
    if ([self globalScore] < 50)
        return @"Not good!";
    else if ([self globalScore] < 70)
        return @"Good!";
    return @"Great!";
}

#pragma mark NSCoding
-(id)initWithCoder:(NSCoder*)decoder {
    self = [super init];
    if( self != nil) {
        self.practiceDatetime = [decoder decodeObjectForKey:@"practiceDatetime"];
        NSArray* encodedOps = [decoder decodeObjectForKey:@"_pastOperations"];
        _pastOperations = [NSMutableArray arrayWithCapacity:[encodedOps count]];
        for (NSData* encodedOp in encodedOps) {
            Operation* decodedOp = (Operation*)[NSKeyedUnarchiver unarchiveObjectWithData:encodedOp];
            [_pastOperations addObject:decodedOp];
        }
        _timeInSeconds = [decoder decodeIntegerForKey:@"_timeInSeconds"];
        _practiceLevel = [decoder decodeIntegerForKey:@"_practiceLevel"];
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder*)encoder {
    [encoder encodeObject:self.practiceDatetime forKey:@"practiceDatetime"];
    [encoder encodeInteger:_practiceLevel forKey:@"_practiceLevel"];
    [encoder encodeInteger:_timeInSeconds forKey:@"_timeInSeconds"];
    
    NSMutableArray* encodedOps = [NSMutableArray arrayWithCapacity:[_pastOperations count]];
    for (Operation *op in _pastOperations) {
        NSData* encodedOp = [NSKeyedArchiver archivedDataWithRootObject:op];
        [encodedOps addObject:encodedOp];
    }
    [encoder encodeObject:encodedOps forKey:@"_pastOperations"];
}

@end
