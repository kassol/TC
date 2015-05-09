//
//  ViewController.m
//  TC
//
//  Created by 张旭 on 15/4/22.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *myOnButton;
@property (weak, nonatomic) IBOutlet UIButton *myOffButton;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_myOnButton setTransform:CGAffineTransformMakeRotation(-M_PI/3)];
    [_myOffButton setTransform:CGAffineTransformMakeRotation(M_PI/3)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
