//
//  ImageHelper.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/22/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "UIHelper.h"
#import "FUIButton.h"
#import "UIBarButtonItem+FlatUI.h"
#import "UIColor+FlatUI.h"
#import "UINavigationBar+FlatUI.h"
#import "UIFont+FlatUI.h"
#import "UIImage+FlatUI.h"

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

+(void)configGreenButton:(FUIButton *)button {
    button.buttonColor = [UIColor colorWithRed:0.32f green:0.64f blue:0.32f alpha:1.00f];
    button.shadowColor = [UIColor greenSeaColor];
    button.shadowHeight = 1.5f;
    button.cornerRadius = 3.0f;
    button.alpha = 0.8;
}

+(void)configBlueButton:(FUIButton *)button {
    button.buttonColor = [UIColor peterRiverColor];
    button.shadowColor = [UIColor belizeHoleColor];
    button.shadowHeight = 1.0f;
    button.cornerRadius = 3.0f;
}

@end
