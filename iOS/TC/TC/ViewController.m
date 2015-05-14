//
//  ViewController.m
//  TC
//
//  Created by 张旭 on 15/4/22.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import "ViewController.h"
#import "ProgressView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *myOnButton;
@property (weak, nonatomic) IBOutlet UIButton *myOffButton;
@property (weak, nonatomic) IBOutlet ProgressView *progressView;
@property (nonatomic) BOOL isStarted;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.myOnButton setTransform:CGAffineTransformMakeRotation(-M_PI/3)];
    [self.myOffButton setTransform:CGAffineTransformMakeRotation(M_PI/3)];
    self.isStarted = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onButtonDidTouch:(id)sender {
    [self.progressView start];
    self.isStarted = YES;
}

- (IBAction)offButtonDidTouch:(id)sender {
    static BOOL isPause = YES;
    
    if (self.isStarted) {
        isPause = !isPause;
        if (isPause) {
            [self.progressView resume];
            [self.myOffButton setImage:[UIImage imageNamed:@"OFF"] forState:UIControlStateNormal];
        } else {
            [self.progressView pause];
            [self.myOffButton setImage:[UIImage imageNamed:@"Resume"] forState:UIControlStateNormal];
        }
    }
}

- (IBAction)cancelButtonDidTouch:(id)sender {
    [self.progressView stop];
    [self.myOffButton setImage:[UIImage imageNamed:@"OFF"] forState:UIControlStateNormal];
    self.isStarted = NO;
}

@end
