//
//  ConfigHelper.h
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 19/4/2013.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConfigHelper : NSObject

+(int)maxDuration;
+(NSArray *)operationsToConsider;
+(void) saveLevel:(NSInteger) level;
+(NSInteger) getLevel;
+(void) saveAddOp:(BOOL) onOff;
+(BOOL) getaddOp;
+(void) saveSubOp:(BOOL) onOff;
+(BOOL) getSubOp;
+(void) saveMultipOp:(BOOL) onOff;
+(BOOL) getMultipOp;
+(void) saveDivOp:(BOOL) onOff;
+(BOOL) getDivOp;
+(void) savePercOp:(BOOL) onOff;
+(BOOL) getPercOp;
+(void) saveTime:(NSInteger) time;
+(NSInteger) getTime;
+(NSString *)getLevelDescr;
@end
