//
//  OperationList.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/17/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "OperationList.h"
#import "OperationFactory.h"

@implementation OperationList

-(id)initWithFactory:(OperationFactory *)factory {
    if (self = [super init]) {
        _pastOperations = [[NSMutableArray alloc] init];
		_factory = factory;
		_currentOperation = [factory create];
    }
    	
    return self;
}

-(Operation *)currentOperation {
	return _currentOperation;
}

-(Operation *)nextOperation {
	[_pastOperations addObject:_currentOperation];
	_currentOperation = [_factory create];
	return _currentOperation;
}

-(int)size {
    return [_pastOperations count];
}

-(int)rightAnswers {
    int right = 0;
    
    for (Operation* operation in _pastOperations) {
        if ([operation isCorrect]) {
            right++;
        }
    }
    
    return right;
}

-(NSString *)scoreAsString {
    return [NSString stringWithFormat:@"%i/%i", [self rightAnswers], [self size]];
}

@end
