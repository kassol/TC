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
@property (nonatomic) BOOL finished;

@end

@implementation ProgressLabel


- (void)updateUI {
    if (self.drawedTime >= self.totalTime-0.1) {
        self.finished = YES;
        [self.timer invalidate];
        self.timer = nil;
    }
    self.drawedTime += REFRESH_TIME;
    
    float currentTime = (1-self.drawedTime/self.totalTime)*[SettingInfo sharedSettingInfo].pomodoroDuration;
    [self setText:[[NSString alloc] initWithFormat:@"%.2f", currentTime]];
}

- (void)start {
    [self.timer invalidate];
    self.finished = NO;
    self.drawedTime = 0;
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
    self.drawedTime = self.totalTime+1;
}

- (void)resume {
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:REFRESH_TIME target:self selector:@selector(updateUI) userInfo:nil repeats:YES];
    }
}

@end
