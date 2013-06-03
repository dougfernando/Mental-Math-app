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

@interface OperationList : NSObject<NSCoding>
{
    OperationFactory *_factory;
	Operation *_currentOperation;
	NSMutableArray *_pastOperations;
    NSInteger _practiceLevel;
    NSInteger _timeInSeconds;

}

@property (readwrite) NSDate *practiceDatetime;
-(id) initWithFactory:(OperationFactory *)factory;
-(Operation *)currentOperation;
-(Operation *)nextOperation;
-(int)rightAnswers;
-(int)size;
-(int)precision;
-(int)addPrecision;
-(int)addTotal;
-(int)subPrecision;
-(int)subTotal;
-(int)multipPrecision;
-(int)multipTotal;
-(int)divPrecision;
-(int)divTotal;
-(int)percPrecision;
-(int)percTotal;
-(float)globalScore;
-(NSNumber *)getAvgTimeAdd;
-(NSNumber *)getAvgTimeSub;
-(NSNumber *)getAvgTimeMul;
-(NSNumber *)getAvgTimeDiv;
-(NSNumber *)getAvgTimePerc;
-(NSNumber *)getAvgTimeTotal;
-(Operation *)operationAt:(NSUInteger)index;
-(NSString *)globalScoreRange;
-(NSString *)getPracticeLevelDesc;
-(NSString *)getTimeInMinutesDesc;
@end
