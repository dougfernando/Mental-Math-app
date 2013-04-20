//
//  OperatorsFactory.h
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/18/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OperatorsPair.h"

@interface OperatorsFactory : NSObject
-(OperatorsPair *)createPairForAdd;
-(OperatorsPair *)createPairForSub;
-(OperatorsPair *)createPairForMultip;
-(OperatorsPair *)createPairForDiv;
-(OperatorsPair *)createPairForPerc;
@end

@interface EasyOperatorsFactory: OperatorsFactory
@end

@interface MediumOperatorsFactory: OperatorsFactory
@end

@interface HardOperatorsFactory: OperatorsFactory
@end