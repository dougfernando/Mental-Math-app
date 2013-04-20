//
//  SettingsViewController.m
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/20/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import "SettingsViewController.h"
#import "ConfigHelper.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

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
    self.levelSegment.selectedSegmentIndex = [ConfigHelper getLevel];
    self.addOp.on = [ConfigHelper getaddOp];
    self.subOp.on = [ConfigHelper getSubOp];
    self.multipOp.on = [ConfigHelper getMultipOp];
    self.divOp.on = [ConfigHelper getDivOp];
    self.percOp.on = [ConfigHelper getPercOp];
    self.timeSegment.selectedSegmentIndex = [ConfigHelper getTime];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)valueChanged:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    
    [ConfigHelper saveLevel:selectedSegment];
}

- (IBAction)addOpChanged:(id)sender {
    [ConfigHelper saveAddOp:self.addOp.on];
}

- (IBAction)subOpChanged:(id)sender {
    [ConfigHelper saveSubOp:self.subOp.on];
}

- (IBAction)multipOpChanged:(id)sender {
    [ConfigHelper saveMultipOp:self.multipOp.on];
}

- (IBAction)divOpChanged:(id)sender {
    [ConfigHelper saveDivOp:self.divOp.on];
}

- (IBAction)percOpChanged:(id)sender {
    [ConfigHelper savePercOp:self.percOp.on];
}

- (IBAction)timeChanged:(id)sender {
    [ConfigHelper saveTime:self.timeSegment.selectedSegmentIndex];
}

@end
