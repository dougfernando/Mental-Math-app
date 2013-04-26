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
    timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(onTimerTick) userInfo:nil repeats:YES];

    UIImage *imageToReturn = [UIImage imageNamed:@"Splash2.png"];
    imageToReturn = [UIImage imageWithCGImage:imageToReturn.CGImage scale:2 orientation:imageToReturn.imageOrientation];
    
    self.backgroundImage.image = imageToReturn;
    
    [self.view addSubview:self.backgroundImage];
    [self.view sendSubviewToBack:self.backgroundImage];
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
