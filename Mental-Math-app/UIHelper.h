//
//  ImageHelper.h
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/22/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FUIButton.h"

@interface UIHelper : NSObject
+(void)addBackground:(UIViewController *)viewController image:(NSString *) imageName alpha:(float)alphaValue;
+(void)addBackground:(UIViewController *)viewController image:(NSString *) imageName;
+(void)configGreenButton:(FUIButton *)button;
+(void)configBlueButton:(FUIButton *)button;
@end
