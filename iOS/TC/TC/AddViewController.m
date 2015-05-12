//
//  AddViewController.m
//  TC
//
//  Created by kassol on 15/5/12.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import "AddViewController.h"

@import Spring;

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet SpringButton *addListButton;
@property (weak, nonatomic) IBOutlet SpringImageView *addListLabel;
@property (weak, nonatomic) IBOutlet SpringImageView *addTaskLabel;

@end

@implementation AddViewController
- (IBAction)closeButtonDidTouch:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    self.addListButton.animation = @"fall";
    self.addListLabel.animation = @"fall";
    self.addTaskLabel.animation = @"fall";
    [self.addListButton animate];
    [self.addListLabel animate];
    [self.addTaskLabel animate];
}

@end
