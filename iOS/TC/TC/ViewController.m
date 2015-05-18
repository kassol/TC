//
//  ViewController.m
//  TC
//
//  Created by 张旭 on 15/4/22.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import "ViewController.h"
#import "ProgressLabel.h"
#import "ProgressInfo.h"
#import "SettingInfo.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *myOnButton;
@property (weak, nonatomic) IBOutlet UIButton *myOffButton;
@property (weak, nonatomic) IBOutlet ProgressView *progressView;
@property (nonatomic) BOOL isStarted;
@property (nonatomic) BOOL isPaused;
@property (nonatomic) BOOL isSettingUpdated;
@property (weak, nonatomic) IBOutlet ProgressLabel *timeLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.myOnButton setTransform:CGAffineTransformMakeRotation(-M_PI/3)];
    [self.myOffButton setTransform:CGAffineTransformMakeRotation(M_PI/3)];
    self.isStarted = NO;
    self.isPaused = YES;
    self.progressView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onButtonDidTouch:(id)sender {
    if (self.isStarted) {
        return;
    }
    [self.progressView start];
    [self.timeLabel start];
    self.isStarted = YES;
    self.isPaused = YES;
    [self.myOffButton setImage:[UIImage imageNamed:@"OFF"] forState:UIControlStateNormal];
}

- (IBAction)offButtonDidTouch:(id)sender {
    
    if (self.isStarted) {
        self.isPaused = !self.isPaused;
        if (self.isPaused) {
            [self.progressView resume];
            [self.timeLabel resume];
            [self.myOffButton setImage:[UIImage imageNamed:@"OFF"] forState:UIControlStateNormal];
        } else {
            [self.progressView pause];
            [self.timeLabel pause];
            [self.myOffButton setImage:[UIImage imageNamed:@"Resume"] forState:UIControlStateNormal];
        }
    }
}

- (IBAction)cancelButtonDidTouch:(id)sender {
    self.isStarted = NO;
    [self.progressView stop];
    [self.timeLabel stop];
    [self.myOffButton setImage:[UIImage imageNamed:@"OFF"] forState:UIControlStateNormal];
    [[ProgressInfo sharedProgressInfo] restoreState];
    if ([SettingInfo sharedSettingInfo].isModified) {
        [self updateControls];
    }
}

- (void)updateControls {
    if (!self.isStarted) {
        [[ProgressInfo sharedProgressInfo] updateSetting];
        [[SettingInfo sharedSettingInfo]modifiedHasUsed];
        [self.timeLabel reloadData];
    }
}

- (void)timerViewDidFinishedTiming:(ProgressView *)TimerView {
    if (self.isStarted) {
        [[ProgressInfo sharedProgressInfo] nextState];
        [self.progressView start];
        [self.timeLabel start];
    }
}

@end
