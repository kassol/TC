//
//  ViewController.m
//  TC
//
//  Created by 张旭 on 15/4/22.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#define REFRESH_TIME 0.04

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onButtonDidTouch:(id)sender {
    if (self.isStarted) {
        return;
    }
    
    self.isStarted = YES;
    self.isPaused = YES;
    [self.myOffButton setImage:[UIImage imageNamed:@"OFF"] forState:UIControlStateNormal];
    
    [[ProgressInfo sharedProgressInfo].timer invalidate];
    [ProgressInfo sharedProgressInfo].timer = [NSTimer scheduledTimerWithTimeInterval:REFRESH_TIME target:self selector:@selector(elapse) userInfo:nil repeats:YES];
}

- (IBAction)offButtonDidTouch:(id)sender {
    if (self.isStarted) {
        self.isPaused = !self.isPaused;
        if (self.isPaused) {
            [self.myOffButton setImage:[UIImage imageNamed:@"OFF"] forState:UIControlStateNormal];
            if (![ProgressInfo sharedProgressInfo].timer) {
                [ProgressInfo sharedProgressInfo].timer = [NSTimer scheduledTimerWithTimeInterval:REFRESH_TIME target:self selector:@selector(elapse) userInfo:nil repeats:YES];
            }
        } else {
            [self.myOffButton setImage:[UIImage imageNamed:@"Resume"] forState:UIControlStateNormal];
            [[ProgressInfo sharedProgressInfo].timer invalidate];
            [ProgressInfo sharedProgressInfo].timer = nil;
        }
    }
}

- (IBAction)cancelButtonDidTouch:(id)sender {
    self.isStarted = NO;
    [self.myOffButton setImage:[UIImage imageNamed:@"OFF"] forState:UIControlStateNormal];
    [[ProgressInfo sharedProgressInfo].timer invalidate];
    [ProgressInfo sharedProgressInfo].timer = nil;
    
    [[ProgressInfo sharedProgressInfo] restoreState];
    if ([SettingInfo sharedSettingInfo].isModified) {
        [self updateSettings];
    }
    
    [self.progressView setNeedsDisplay];
    [self.timeLabel updateUI];
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
    [[ProgressInfo sharedProgressInfo] elapse:REFRESH_TIME];
    [self.progressView setNeedsDisplay];
    [self.timeLabel updateUI];
    if ([[ProgressInfo sharedProgressInfo] isFinshedCurrentState]) {
        [[ProgressInfo sharedProgressInfo] nextState];
    }
}

@end
