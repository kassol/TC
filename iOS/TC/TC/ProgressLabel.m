//
//  ProgressLabel.m
//  TC
//
//  Created by kassol on 15/5/14.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#define REFRESH_TIME 0.04

#import "ProgressLabel.h"
#import "SettingInfo.h"

@interface ProgressLabel ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) float drawedTime;
@property (nonatomic) float totalTime;
@property (nonatomic) BOOL finished;

@end

@implementation ProgressLabel


- (void)updateUI {
    if (self.drawedTime >= self.totalTime-0.1) {
        self.finished = YES;
        self.totalTime = [SettingInfo sharedSettingInfo].pomodoroDuration*60;
        [self.timer invalidate];
        self.timer = nil;
    }
    if (self.finished) {
        self.drawedTime = 0;
    } else {
        self.drawedTime += REFRESH_TIME;
    }
    
    int currentMinute = (int)(self.totalTime-self.drawedTime)/60;
    int currentSecond = (int)(self.totalTime-self.drawedTime)%60;
    [self setText:[[NSString alloc] initWithFormat:@"%i:%02i", currentMinute, currentSecond]];
}

- (void)start {
    [self.timer invalidate];
    self.finished = NO;
    self.drawedTime = 0;
    self.totalTime = [SettingInfo sharedSettingInfo].pomodoroDuration*60;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:REFRESH_TIME target:self selector:@selector(updateUI)  userInfo:nil repeats:YES];
}

- (void)pause {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)stop {
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:REFRESH_TIME target:self selector:@selector(updateUI) userInfo:nil repeats:YES];
    }
    self.drawedTime = self.totalTime;
}

- (void)resume {
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:REFRESH_TIME target:self selector:@selector(updateUI) userInfo:nil repeats:YES];
    }
}

@end
