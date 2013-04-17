//
//  Operation.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/16/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "Operation.h"

@implementation Operation

-(id)initWith:(float)aArg1 andWithArg2:(float)aArg2 andWithOperation:(char)aOperation {
    if ( self = [super init] ) {
        self.arg1 = aArg1;
        self.arg2 = aArg2;
        self.operation = aOperation;
    }

    return self;
}

+(id)createRandom {
    float smallNumber = 0;
    float bigNumber = 10;
    
    float diff = bigNumber - smallNumber;
    float rArg1 = (int)(((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * diff) + smallNumber;
    float rArg2 = (int)(((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * diff) + smallNumber;

    char operations[] = { '+', '-', '*', '/', '%' };
    int position = arc4random() % 5;

    return [[Operation alloc] initWith:rArg1 andWithArg2:rArg2 andWithOperation:operations[position]];
}

-(float)execute {
    float result;
    switch (self.operation) {
        case '+':
            result = self.arg1 + self.arg2;
            break;
        case '-':
            result = self.arg1 - self.arg2;
            break;
        case '*':
            result = self.arg1 * self.arg2;
            break;
        case '/':
            result = self.arg1 / self.arg2;
            break;
        case '%':
            result = self.arg1/100 *  self.arg2;
            break;
        default:
            result = -10000000000;
            break;
    }
    
    return result;
}

-(BOOL)isTheResult:(float)possibleResult {
    return fabs([self execute] - possibleResult) < 0.0000001;
}

-(NSString *)executeAsString {
    return [NSString stringWithFormat:@"%f", [self execute]];
}

-(NSString *)arg1AsString {
    return [NSString stringWithFormat:@"%f", self.arg1];
}

-(NSString *)arg2AsString {
    return [NSString stringWithFormat:@"%f", self.arg2];
}

-(NSString *)operationAsString {
    return [NSString stringWithFormat:@"%c", self.operation];
}

@end
