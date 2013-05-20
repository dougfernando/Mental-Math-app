//
//  SecondViewController.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/16/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "MainViewController.h"
#import "UIHelper.h"
#import "UIColor+FlatUI.h"


@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [UIHelper addBackground:self image:@"main-background.png"];
    [UIHelper configGreenButton:self.runButton];
    [UIHelper configBlueButton:self.settingsButton];
    [UIHelper configBlueButton:self.pastResultsButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(IBAction)returnActionForSegue:(UIStoryboardSegue *)returnSegue {
    
    // do useful actions here.
    
}

@end
