//
//  ImageHelper.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/22/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "UIHelper.h"

@implementation UIHelper

+(void)addBackground:(UIViewController *)viewController image:(NSString *) imageName alpha:(float)alphaValue {
    viewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:imageName]];
    
//    UIImage *imageToReturn = [UIImage imageNamed:imageName];
//    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:imageToReturn];
//    backgroundImage.contentMode = UIViewContentModeScaleToFill;
//    backgroundImage.alpha = alphaValue;
//
//    [viewController.view addSubview:backgroundImage];
//    [viewController.view sendSubviewToBack:backgroundImage];

}

+(void)addBackground:(UIViewController *)viewController image:(NSString *) imageName {
    [self addBackground:viewController image:imageName alpha:1.0];
}



@end
