//
//  OperatorsPair.h
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/18/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OperatorsPair : NSObject

@property (readwrite) float arg1;
@property (readwrite) float arg2;

-(id)initWith: (float)aArg1 andWithArg2:(float)aArg2;

@end
