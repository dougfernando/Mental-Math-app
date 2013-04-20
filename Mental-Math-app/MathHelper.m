//
//  MathHelper.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/18/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "MathHelper.h"

@implementation MathHelper
+(int)rndFrom:(int)arg1 to:(int)arg2 {
    int lowerBound = arg1;
    int upperBound = arg2;
    int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);
    return rndValue;
}
@end
