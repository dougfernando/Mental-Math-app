//
//  SecondViewController.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/16/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "MainViewController.h"
#import "UIHelper.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.runButton setType:BButtonTypeSuccess];
    self.settingsButton.color = [UIHelper getBlueButtonColor];
    [self.pastResultsButton setType:BButtonTypeWarning];
//    [UIHelper addBackground:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
