//
//  Operation.h
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/16/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Operation : NSObject

@property (readwrite) float arg1;
@property (readwrite) float arg2;
@property (readwrite) float result;
@property (readwrite) char operation;

-(id)initWith: (float)aArg1 andWithArg2:(float)aArg2;
-(float)execute;
-(NSString *)executeAsString;
-(NSString *)arg1AsString;
-(NSString *)arg2AsString;
-(NSString *)operationAsString;
-(BOOL)isTheResult:(float)possibleResult;
-(BOOL)isCorrect;
-(BOOL)isValid;
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