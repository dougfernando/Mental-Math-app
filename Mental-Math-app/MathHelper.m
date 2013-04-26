//
//  MathHelper.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/18/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "MathHelper.h"

NSNumberFormatter *formatter;

@implementation MathHelper
+(int)rndFrom:(int)arg1 to:(int)arg2 {
    int lowerBound = arg1;
    int upperBound = arg2;
    int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);
    return rndValue;
}

+(NSString *)formatAsString:(NSNumber *)input {
    if (formatter == nil) {
        formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    }
    
    return [formatter stringFromNumber:input];
}

+(NSNumber *)asNumber:(NSString *)input {
    if (formatter == nil) {
        formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    }
    
    return [formatter numberFromString:input];
}



@end
