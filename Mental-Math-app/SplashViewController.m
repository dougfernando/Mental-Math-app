//
//  SplashViewController.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/21/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "SplashViewController.h"

@interface SplashViewController ()
{
    NSTimer *timer;
}
@end

@implementation SplashViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(onTimerTick) userInfo:nil repeats:YES];

    UIImage *imageToReturn = [UIImage imageNamed:@"Splash.png"];
    imageToReturn = [UIImage imageWithCGImage:imageToReturn.CGImage scale:2 orientation:imageToReturn.imageOrientation];
    
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:imageToReturn];
    
    [self.view addSubview:backgroundImage];
    [self.view sendSubviewToBack:backgroundImage];
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
