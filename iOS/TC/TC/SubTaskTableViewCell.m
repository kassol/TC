//
//  SubTaskTableViewCell.m
//  TC
//
//  Created by kassol on 15/5/27.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import "SubTaskTableViewCell.h"

@implementation SubTaskTableViewCell

- (void)awakeFromNib {
    self.taskNameField.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.taskNameField resignFirstResponder];
    return YES;
}

@end
