//
//  OperationTableCell.h
//  Mental-Math-app
//
//  Created by Douglas Fernando da Silva on 5/15/13.
//  Copyright (c) 2013 Douglas Fernando da Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OperationTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *operationLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightAnswerLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;

@end
