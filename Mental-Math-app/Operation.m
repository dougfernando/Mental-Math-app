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

-(NSString *)operationAsString {
    return [NSString stringWithFormat:@"%c", self.operation];
}

-(NSString *)description {
   return [NSString stringWithFormat: @"%i %c %i = %f; is correct? %@", (int)self.arg1, self.operation, (int)self.arg2, self.result, ([self isCorrect] ? @"TRUE" : @"FALSE")];
}

#pragma mark NSCoding
-(id)initWithCoder:(NSCoder*)decoder {
    float arg1 = [decoder decodeFloatForKey:@"arg1"];
    float arg2 = [decoder decodeFloatForKey:@"arg2"];
    float result = [decoder decodeFloatForKey:@"result"];
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
    
    return resultOp;
}

-(void)encodeWithCoder:(NSCoder*)encoder {
    [encoder encodeFloat:self.arg1 forKey:@"arg1"];
    [encoder encodeFloat:self.arg2 forKey:@"arg2"];
    [encoder encodeFloat:self.result forKey:@"result"];
    [encoder encodeObject:[NSString stringWithFormat:@"%c", self.operation] forKey:@"op"];
}

@end

@implementation PlusOperation

-(id)initWith: (float)aArg1 andWithArg2:(float)aArg2 {
    if ( self = [super initWith:aArg1 andWithArg2:aArg2] ) {
        self.operation = '+';
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
        self.operation = '-';
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
        self.operation = '*';
    }
    
    return self;
}


-(float)execute {
    return self.arg1 * self.arg2;
}

@end

@implementation DivOperation

-(id)initWith: (float)aArg1 andWithArg2:(float)aArg2 {
    if ( self = [super initWith:aArg1 andWithArg2:aArg2] ) {
        self.operation = '/';
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
        self.operation = '%';
    }
    
    return self;
}

-(float)execute {
    return self.arg1 / 100 * self.arg2;
}

@end