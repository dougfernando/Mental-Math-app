//
//  Operation.h
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/16/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OperatorsPair.h"

@interface Operation : NSObject<NSCoding>

@property (readwrite) float arg1;
@property (readwrite) float arg2;
@property (readwrite) float result;
@property (readwrite) NSDate *startTime;
@property (readwrite) NSDate *endTime;
@property (readwrite) char operationOperator;

-(id)initWith: (float)aArg1 andWithArg2:(float)aArg2;
-(id)initWithPair: (OperatorsPair *)pair;
-(float)execute;
-(NSString *)executeAsString;
-(NSString *)arg1AsString;
-(NSString *)arg2AsString;
-(NSString *)operatorAsString;
-(NSString *)operationAsString;
-(NSString *)description;
-(NSString *)operationDescription;
-(BOOL)isCorrect;
-(NSNumber *)durationInSeconds;
@end

@interface PlusOperation: Operation
@end

@interface MinusOperation: Operation
@end

@interface MultipOperation: Operation
@end

@interface DivOperation: Operation
@end

@interface PercOperation: Operation
@end