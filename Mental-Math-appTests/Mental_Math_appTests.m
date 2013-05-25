//
//  Mental_Math_appTests.m
//  Mental-Math-appTests
//
//  Created by Douglas Fernando da Silva on 4/16/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "Mental_Math_appTests.h"
#import "Operation.h"

@implementation Mental_Math_appTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    PercOperation *op = [[PercOperation alloc] initWith:30.0 andWithArg2:90.0];
    op.result = 27;
    BOOL result = [op isCorrect];
    STAssertFalse(result, @"Failed to calc");
//    STFail(@"Unit tests are not implemented yet in Mental-Math-appTests");
}

@end
