//
//  SecondViewController.h
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 4/16/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BButton.h"

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet BButton *runButton;
@property (weak, nonatomic) IBOutlet BButton *settingsButton;

@end
