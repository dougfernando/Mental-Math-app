//
//  SplashViewController.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/21/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "SplashViewController.h"
#import "UIHelper.h"
#import "UIBarButtonItem+FlatUI.h"
#import "UIColor+FlatUI.h"
#import "UINavigationBar+FlatUI.h"
#import "UIFont+FlatUI.h"
#import "UIImage+FlatUI.h"

@interface SplashViewController ()
{
    NSTimer *timer;
}
@end

@implementation SplashViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(onTimerTick) userInfo:nil repeats:YES];
    [UIHelper addBackground:self image:@"splash.png"];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor midnightBlueColor] cornerRadius:0] forBarMetrics:UIBarMetricsDefault & UIBarMetricsLandscapePhone];
    [UIBarButtonItem configureFlatButtonsWithColor:[UIColor peterRiverColor]
                                  highlightedColor:[UIColor belizeHoleColor]
                                      cornerRadius:3];

}

-(void)onTimerTick {
    [timer invalidate];
    [self performSegueWithIdentifier:@"goToMainSegue" sender:self];    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
