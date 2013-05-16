//
//  Operation.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/16/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "Operation.h"
#import "MathHelper.h"

@implementation Operation


-(id)initWith: (float)aArg1 andWithArg2:(float)aArg2 {
    if ( self = [super init] ) {
        self.arg1 = aArg1;
        self.arg2 = aArg2;
    }

    return self;
}

-(id)initWithPair: (OperatorsPair *)pair {
    return [self initWith:pair.arg1 andWithArg2:pair.arg2];
}

-(float)execute {
    float result = -100000;

    return result;
}

-(BOOL)isCorrect {
    float executeResult = [self execute];
    return fabs(executeResult - self.result) < 0.0000001;
}

-(NSString *)executeAsString {
    return [NSString stringWithFormat:@"%f", [self execute]];
}

-(NSString *)arg1AsString {
    return [MathHelper formatAsString:[NSNumber numberWithFloat:self.arg1]];
}

-(NSString *)arg2AsString {
    return [MathHelper formatAsString:[NSNumber numberWithFloat:self.arg2]];
}

-(NSString *)operatorAsString {
    return [NSString stringWithFormat:@"%c", self.operationOperator];
}

-(NSString *)operationAsString {
    return [NSString stringWithFormat:@"%@ %c %@", [self arg1AsString], self.operationOperator, [self arg2AsString]];
}

-(NSNumber *)durationInSeconds {
    return [NSNumber numberWithDouble:[self.endTime timeIntervalSinceDate:self.startTime]];
}

-(NSString *)description {
    NSString *arg1 = [MathHelper formatAsString:[NSNumber numberWithFloat:self.arg1]];
    NSString *arg2 = [MathHelper formatAsString:[NSNumber numberWithFloat:self.arg2]];
    NSString *operator = [self operatorAsString];
    NSString *result = [MathHelper formatAsString:[NSNumber numberWithFloat:self.result]];
    NSString *isRight = [self isCorrect] ? @"RIGHT" : @"WRONG";
    
    
   return [NSString stringWithFormat: @"%@ %@ %@ = %@ => %@", arg1, operator, arg2, result, isRight];
}

-(NSString *)operationDescription {
    NSString *arg1 = [MathHelper formatAsString:[NSNumber numberWithFloat:self.arg1]];
    NSString *arg2 = [MathHelper formatAsString:[NSNumber numberWithFloat:self.arg2]];
    NSString *operator = [self operatorAsString];
    NSString *result = [MathHelper formatAsString:[NSNumber numberWithFloat:self.result]];
    
    return [NSString stringWithFormat: @"%@ %@ %@ = %@", arg1, operator, arg2, result];
}


#pragma mark NSCoding
-(id)initWithCoder:(NSCoder*)decoder {
    float arg1 = [decoder decodeFloatForKey:@"arg1"];
    float arg2 = [decoder decodeFloatForKey:@"arg2"];
    float result = [decoder decodeFloatForKey:@"result"];
    NSDate *start = [decoder decodeObjectForKey:@"start"];
    NSDate *end = [decoder decodeObjectForKey:@"end"];

    NSString *opstr = [decoder decodeObjectForKey:@"op"];
    char op = [opstr characterAtIndex:0];
    Operation *resultOp = nil;
    
    switch (op) {
        case '+':
            resultOp = [[PlusOperation alloc] initWith:arg1 andWithArg2:arg2];
            break;
        case '-':
            resultOp = [[MinusOperation alloc] initWith:arg1 andWithArg2:arg2];
            break;
        case '*':
            resultOp = [[MultipOperation alloc] initWith:arg1 andWithArg2:arg2];
            break;
        case '/':
            resultOp = [[DivOperation alloc] initWith:arg1 andWithArg2:arg2];
            break;
        case '%':
            resultOp = [[PercOperation alloc] initWith:arg1 andWithArg2:arg2];
            break;
        default:
            return nil;
            break;
    }
    
    resultOp.result = result;
    resultOp.startTime = start;
    resultOp.endTime = end;
    
    return resultOp;
}

-(void)encodeWithCoder:(NSCoder*)encoder {
    [encoder encodeFloat:self.arg1 forKey:@"arg1"];
    [encoder encodeFloat:self.arg2 forKey:@"arg2"];
    [encoder encodeFloat:self.result forKey:@"result"];
    [encoder encodeObject:self.startTime forKey:@"start"];
    [encoder encodeObject:self.endTime forKey:@"end"];
    
    [encoder encodeObject:[NSString stringWithFormat:@"%c", self.operationOperator] forKey:@"op"];
}

@end

@implementation PlusOperation

-(id)initWith: (float)aArg1 andWithArg2:(float)aArg2 {
    if ( self = [super initWith:aArg1 andWithArg2:aArg2] ) {
        self.operationOperator = '+';
    }
    
    return self;
}

-(float)execute {
    return self.arg1 + self.arg2;
}

@end

@implementation MinusOperation

-(id)initWith: (float)aArg1 andWithArg2:(float)aArg2 {
    if ( self = [super initWith:aArg1 andWithArg2:aArg2] ) {
        self.operationOperator = '-';
    }
    
    return self;
}

-(float)execute {
    return self.arg1 - self.arg2;
}

@end

@implementation MultipOperation

-(id)initWith: (float)aArg1 andWithArg2:(float)aArg2 {
    if ( self = [super initWith:aArg1 andWithArg2:aArg2] ) {
        self.operationOperator = '*';
    }
    
    return self;
}

-(NSString *)operationAsString {
    return [NSString stringWithFormat:@"%@ x %@", [self arg1AsString], [self arg2AsString]];
}


-(float)execute {
    return self.arg1 * self.arg2;
}

@end

@implementation DivOperation

-(id)initWith: (float)aArg1 andWithArg2:(float)aArg2 {
    if ( self = [super initWith:aArg1 andWithArg2:aArg2] ) {
        self.operationOperator = '/';
    }
    
    return self;
}

-(float)execute {
    return self.arg1 / self.arg2;
}

@end

@implementation PercOperation

-(id)initWith: (float)aArg1 andWithArg2:(float)aArg2 {
    if ( self = [super initWith:aArg1 andWithArg2:aArg2] ) {
        self.operationOperator = '%';
    }
    
    return self;
}

-(float)execute {
    return self.arg1 / 100 * self.arg2;
}

-(NSString *)operationAsString {
    return [NSString stringWithFormat:@"%@%% of %@", [self arg1AsString], [self arg2AsString]];
}


@end