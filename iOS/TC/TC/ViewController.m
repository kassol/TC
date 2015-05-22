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
    [ProgressInfo sharedProgressInfo].delegate = self;
    [self.timeLabel updateUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onButtonDidTouch:(id)sender {
    if ([[ProgressInfo sharedProgressInfo] isStarted]) {
        return;
    }
    [self.myOffButton setImage:[UIImage imageNamed:@"OFF"] forState:UIControlStateNormal];
    [[ProgressInfo sharedProgressInfo] start];
}

- (IBAction)offButtonDidTouch:(id)sender {
    if ([[ProgressInfo sharedProgressInfo] isStarted]) {
        if ([[ProgressInfo sharedProgressInfo] isPaused]) {
            [self.myOffButton setImage:[UIImage imageNamed:@"OFF"] forState:UIControlStateNormal];
            [[ProgressInfo sharedProgressInfo] resume];
        } else {
            [self.myOffButton setImage:[UIImage imageNamed:@"Resume"] forState:UIControlStateNormal];
            [[ProgressInfo sharedProgressInfo] pause];
        }
    }
}

- (IBAction)cancelButtonDidTouch:(id)sender {
    if ([[ProgressInfo sharedProgressInfo] isStarted]) {
        [self.myOffButton setImage:[UIImage imageNamed:@"OFF"] forState:UIControlStateNormal];
        [[ProgressInfo sharedProgressInfo] stop];
        [self.progressView setNeedsDisplay];
        [self.timeLabel updateUI];
    }
}

- (void)updateSettings {
    if (!self.isStarted) {
        [[ProgressInfo sharedProgressInfo] updateSetting];
        [[SettingInfo sharedSettingInfo]modifiedHasUsed];
        [self.progressView setNeedsDisplay];
        [self.timeLabel updateUI];
    }
}

- (void)elapse {
    [self.progressView setNeedsDisplay];
    [self.timeLabel updateUI];
    if ([[ProgressInfo sharedProgressInfo] isFinshedCurrentState]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Attention" message:@"Time is up!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [[ProgressInfo sharedProgressInfo] nextState];
        [[ProgressInfo sharedProgressInfo] start];
    }
}


@end
