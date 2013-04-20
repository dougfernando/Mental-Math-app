//
//  OperationFactory.h
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/17/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Operation.h"
#import "OperatorsFactory.h"

@interface OperationFactory : NSObject
-(id)init;
-(Operation *)create;
@end

@interface RandomOperationFactory: OperationFactory

@end