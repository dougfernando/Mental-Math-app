//
//  OperationFactory.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/17/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "OperationFactory.h"


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
    Operation *op = nil;
    do {
        float smallNumber = 0;
        float bigNumber = 10;
    
        float diff = bigNumber - smallNumber;
        float rArg1 = (int)(((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * diff) + smallNumber;
        float rArg2 = (int)(((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * diff) + smallNumber;
    
        char operations[] = { '+', '-', '*', '/', '%' };
        int position = arc4random() % 4;
        
        char operationChar = operations[position];
        switch (operationChar) {
            case '+':
                op = [[PlusOperation alloc] initWith:rArg1 andWithArg2:rArg2];
                break;
            case '-':
                op = [[MinusOperation alloc] initWith:rArg1 andWithArg2:rArg2];
                break;
            case '*':
                op = [[MultipOperation alloc] initWith:rArg1 andWithArg2:rArg2];
                break;
            case '/':
                op = [[DivOperation alloc] initWith:rArg1 andWithArg2:rArg2];
                break;
            case '%':
                op = [[PercOperation alloc] initWith:rArg1 andWithArg2:rArg2];
                break;
            default:
                op = nil;
                break;
        }
    } while(![op isValid]);
    return op;
}
@end

