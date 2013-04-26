//
//  OperationList.h
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/17/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Operation.h"
#import "OperationFactory.h"

@interface OperationList : NSObject
{
    OperationFactory *_factory;
	Operation *_currentOperation;
	NSMutableArray *_pastOperations;
}


-(id) initWithFactory:(OperationFactory *)factory;
-(Operation *)currentOperation;
-(Operation *)nextOperation;
-(int)rightAnswers;
-(int)size;
-(int)precision;
-(NSString *)scoreAsString;
-(NSString *)detailedResult;
-(NSString *)macroScore;

@end
