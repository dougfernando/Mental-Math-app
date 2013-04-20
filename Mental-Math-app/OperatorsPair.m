//
//  OperatorsPair.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/18/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "OperatorsPair.h"

@implementation OperatorsPair
-(id)initWith: (float)aArg1 andWithArg2:(float)aArg2 {
    if ( self = [super init] ) {
        self.arg1 = aArg1;
        self.arg2 = aArg2;
    }
    
    return self;
}
@end
