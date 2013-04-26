//
//  OperatorsFactory.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/18/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "OperatorsFactory.h"
#import "OperatorsPair.h"
#import "MathHelper.h"
#include <math.h>

@implementation OperatorsFactory
-(OperatorsPair *)createPairForAdd {    return nil;  }
-(OperatorsPair *)createPairForSub {    return nil;  }
-(OperatorsPair *)createPairForMultip { return nil;  }
-(OperatorsPair *)createPairForDiv {    return nil;  }
-(OperatorsPair *)createPairForPerc {   return nil;  }
@end

@implementation EasyOperatorsFactory

-(OperatorsPair *)createPairForAdd {
    int arg1 = [MathHelper rndFrom:1 to:20];
    int arg2 = [MathHelper rndFrom:1 to:20];
    return [[OperatorsPair alloc] initWith: arg1 andWithArg2: arg2];
}
-(OperatorsPair *)createPairForSub {
    int arg1 = [MathHelper rndFrom:1 to:40];
    int arg2 = [MathHelper rndFrom:1 to:arg1];
    return [[OperatorsPair alloc] initWith: arg1 andWithArg2: arg2];
}

-(OperatorsPair *)createPairForMultip {
    int arg1 = [MathHelper rndFrom:1 to:10];
    int arg2 = [MathHelper rndFrom:1 to:10];
    return [[OperatorsPair alloc] initWith: arg1 andWithArg2: arg2];
}

-(OperatorsPair *)createPairForDiv {
    int arg2 = [MathHelper rndFrom:1 to:10];
    int arg1 = [MathHelper rndFrom:1 to:10] * arg2;

    return [[OperatorsPair alloc] initWith: arg1 andWithArg2: arg2];
}
-(OperatorsPair *)createPairForPerc {
    int arg1 = [MathHelper rndFrom:1 to:9] * 10;
    int arg2 = [MathHelper rndFrom:1 to:10] * 10;
    
    return [[OperatorsPair alloc] initWith: arg1 andWithArg2: arg2];
}
@end

@implementation MediumOperatorsFactory

-(OperatorsPair *)createPairForAdd {
    int arg1 = [MathHelper rndFrom:1 to:100];
    int arg2 = [MathHelper rndFrom:1 to:100];
    return [[OperatorsPair alloc] initWith: arg1 andWithArg2: arg2];
}
-(OperatorsPair *)createPairForSub {
    int arg1 = [MathHelper rndFrom:1 to:200];
    int arg2 = [MathHelper rndFrom:1 to:arg1];
    return [[OperatorsPair alloc] initWith: arg1 andWithArg2: arg2];
}
-(OperatorsPair *)createPairForMultip {
    int factor1a[] = {1, 10, 100};
    int factor1 = factor1a[[MathHelper rndFrom:0 to:2]];
    int arg1 = [MathHelper rndFrom:1 to:20];
    int factor2a[] = {1, 10, 100};
    int factor2 = factor2a[[MathHelper rndFrom:0 to:2]];
    int arg2 = [MathHelper rndFrom:1 to:20];
    return [[OperatorsPair alloc] initWith: arg1*factor1 andWithArg2: arg2*factor2];
}

-(OperatorsPair *)createPairForDiv {
    int factor2a[] = {1, 10};
    int factor2 = factor2a[[MathHelper rndFrom:0 to:1]];
    int arg2 = [MathHelper rndFrom:1 to:10];

    int factor1a[] = {1, 10};
    int factor1 = factor1a[[MathHelper rndFrom:0 to:1]];
    int arg1 = [MathHelper rndFrom:1 to:10];
    return [[OperatorsPair alloc] initWith: arg1*factor1*arg2*factor2 andWithArg2: arg2*factor2];
}
-(OperatorsPair *)createPairForPerc {
    int arg1a[] = { 10, 20, 30, 40, 50, 60, 70, 80, 90, 25, 75 };
    int arg1 = arg1a[[MathHelper rndFrom:0 to:10]];
    
	int factor2a[] = {100, 1000, 10000};
    int factor2 = factor2a[[MathHelper rndFrom:0 to:2]];
	int arg2 = [MathHelper rndFrom:1 to:10];
    
    return [[OperatorsPair alloc] initWith: arg1 andWithArg2: arg2*factor2];
}
@end


@implementation HardOperatorsFactory
-(OperatorsPair *)createPairForAdd {
    int arg1 = [MathHelper rndFrom:1 to:1000];
    int arg2 = [MathHelper rndFrom:1 to:1000];
    return [[OperatorsPair alloc] initWith: arg1 andWithArg2: arg2];
}

// TODO implement new strategy
-(OperatorsPair *)createPairForSub {
    int arg1 = [MathHelper rndFrom:1 to:500];
    int arg2 = [MathHelper rndFrom:1 to:arg1];
    return [[OperatorsPair alloc] initWith: arg1 andWithArg2: arg2];
}

// BUG: B may be zero
-(OperatorsPair *)createPairForMultip {
    int factor1a[] = {100, 1000, 10000, 100000, 1000000};
    int factor1 = factor1a[[MathHelper rndFrom:0 to:4]];
    int arg1 = [MathHelper rndFrom:1 to:10];
    
	int finalArg1 = factor1 * arg1;
	
	int maxFactor = 9 - (int)log10(finalArg1); // max 10 billion
	int factor2 = pow(10, [MathHelper rndFrom:0 to:maxFactor - 1] % maxFactor);
    int arg2 = [MathHelper rndFrom:1 to:10];
	
    return [[OperatorsPair alloc] initWith: arg1*factor1 andWithArg2: arg2*factor2];
}

// TODO: too hard
-(OperatorsPair *)createPairForDiv {
	int resulta[] = {10000, 100000, 1000000, 10000000, 100000000};
	int factor2 = resulta[[MathHelper rndFrom:0 to:4]];
	int result = [MathHelper rndFrom:1 to:20] * factor2;
	
    int factor3a[] = {1, 10};
    int factor3 = factor3a[[MathHelper rndFrom:0 to:1]];
    int arg2 = [MathHelper rndFrom:1 to:20] * factor3;

    return [[OperatorsPair alloc] initWith:(result * arg2) andWithArg2: arg2];
}

-(OperatorsPair *)createPairForPerc {
    int arg1a[] = { 10, 20, 30, 40, 50, 60, 70, 80, 90, 25, 75 };
    int arg1 = arg1a[[MathHelper rndFrom:0 to:10]];

	int arg2a[] = {10000, 100000, 1000000, 10000000, 100000000};
	int arg2 = arg2a[[MathHelper rndFrom:0 to:4]] * [MathHelper rndFrom:1 to:20];
    
    
    return [[OperatorsPair alloc] initWith: arg1 andWithArg2: arg2];
}
@end

