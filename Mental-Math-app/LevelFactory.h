//
//  LevelFactory.h
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/19/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OperatorsFactory.h"

@interface LevelFactory : NSObject

+(OperatorsFactory *)createOperatorsFactory;

@end
