//
//  ProgressInfo.m
//  TC
//
//  Created by kassol on 15/5/17.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import "ProgressInfo.h"
#import "SettingInfo.h"

@interface ProgressInfo ()
@property (nonatomic) NSInteger state;  //0 for work, 1 for short break, 2 for long break;
@property (nonatomic) NSInteger counter;

@property (nonatomic) NSInteger nearlyPomodoroDuration;
@property (nonatomic) NSInteger nearlyShortBreak;
@property (nonatomic) NSInteger nearlyLongBreak;
@property (nonatomic) NSInteger nearlyLongBreakAfter;
@end

@implementation ProgressInfo

static ProgressInfo *progressInfoInstance = nil;

+ (instancetype)sharedProgressInfo {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        progressInfoInstance = [[self alloc] init];
    });
    return progressInfoInstance;
}

- (instancetype)init {
    self = [super init];
    self.state = 0;
    self.counter = 0;
    [self updateSetting];
    return self;
}

- (void)updateSetting {
    self.nearlyPomodoroDuration = [SettingInfo sharedSettingInfo].pomodoroDuration;
    self.nearlyShortBreak = [SettingInfo sharedSettingInfo].shortBreak;
    self.nearlyLongBreak = [SettingInfo sharedSettingInfo].longBreak;
    self.nearlyLongBreakAfter = [SettingInfo sharedSettingInfo].longBreakAfter;
}

- (void)nextState {
    ++self.counter;
    if (self.counter%2 == 0) {
        self.state = 0;
    } else if ((self.counter/2)%self.nearlyLongBreakAfter == 0) {
        self.state = 2;
    } else {
        self.state = 1;
    }
}

- (float)currentTotalTime {
    if (self.state == 0) {
        return self.nearlyPomodoroDuration*60;
    } else if (self.state == 1) {
        return self.nearlyShortBreak*60;
    } else {
        return self.nearlyLongBreak*60;
    }
}



@end
