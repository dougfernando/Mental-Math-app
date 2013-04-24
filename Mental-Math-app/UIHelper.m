//
//  ImageHelper.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/22/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "UIHelper.h"

static UIImage *backgroundImage;


@implementation UIHelper

+(UIImage *)getBackgroundImage {
    if (backgroundImage == nil) {
        backgroundImage = [UIImage imageNamed:@"main-background.png"];
        backgroundImage = [UIImage imageWithCGImage:backgroundImage.CGImage scale:2 orientation:backgroundImage.imageOrientation];
    }
    return backgroundImage;
}

+(void)addBackground:(UIViewController *)viewController {
    UIImage *imageToReturn = [self getBackgroundImage];
    
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:imageToReturn];
    
    [viewController.view addSubview:backgroundImage];
    [viewController.view sendSubviewToBack:backgroundImage];
}

+(UIColor *)getBlueButtonColor {
    return [UIColor colorWithRed:0.00f green:0.33f blue:0.80f alpha:1.00f];
}
@end
