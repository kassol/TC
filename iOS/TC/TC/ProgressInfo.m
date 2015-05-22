//
//  ProgressInfo.m
//  TC
//
//  Created by kassol on 15/5/17.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#define REFRESH_TIME 0.04

#import "ProgressInfo.h"
#import "SettingInfo.h"
@import UIKit;

@interface ProgressInfo ()
@property (nonatomic) NSInteger state;  //0 for work, 1 for short break, 2 for long break;
@property (nonatomic) NSInteger counter;

@property (nonatomic) NSInteger nearlyPomodoroDuration;
@property (nonatomic) NSInteger nearlyShortBreak;
@property (nonatomic) NSInteger nearlyLongBreak;
@property (nonatomic) NSInteger nearlyLongBreakAfter;
@property (nonatomic, strong) UILocalNotification *notification;
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
    self.isStarted = NO;
    self.isPaused = NO;
    self.state = 0;
    self.counter = 0;
    self.isFinshedCurrentState = NO;
    [self updateSetting];
    return self;
}

- (void)elapse:(float)elapseTime {
    self.elapseTime += elapseTime;
    
    if (self.elapseTime >= self.totalTime-0.1) {
        self.isFinshedCurrentState = YES;
        self.elapseTime = self.totalTime;
    }
}

- (void)updateSetting {
    self.nearlyPomodoroDuration = [SettingInfo sharedSettingInfo].pomodoroDuration;
    self.nearlyShortBreak = [SettingInfo sharedSettingInfo].shortBreak;
    self.nearlyLongBreak = [SettingInfo sharedSettingInfo].longBreak;
    self.nearlyLongBreakAfter = [SettingInfo sharedSettingInfo].longBreakAfter;
    [self restoreState];
}

- (void)nextState {
    self.isFinshedCurrentState = NO;
    ++self.counter;
    if (self.counter%2 == 0) {
        self.state = 0;
    } else if ((self.counter/2)%self.nearlyLongBreakAfter == self.nearlyLongBreakAfter-1) {
        self.state = 2;
    } else {
        self.state = 1;
    }
    self.elapseTime = 0;
    if (self.state == 0) {
        self.totalTime = self.nearlyPomodoroDuration*60;
    } else if (self.state == 1) {
        self.totalTime = self.nearlyShortBreak*60;
    } else {
        self.totalTime = self.nearlyLongBreak*60;
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

- (void)restoreState {
    self.counter = 0;
    self.state = 0;
    self.elapseTime = 0;
    self.totalTime = self.nearlyPomodoroDuration*60;
    self.isStarted = NO;
    self.isPaused = NO;
}

- (void)startNotification {
    if (self.notification == nil) {
        self.notification = [[UILocalNotification alloc] init];
    }
    self.notification.fireDate = [[NSDate date] dateByAddingTimeInterval:self.totalTime-self.elapseTime];
    self.notification.timeZone = [NSTimeZone defaultTimeZone];
    self.notification.soundName = @"ping.caf";
    self.notification.alertBody = @"Time is up!";
    NSDictionary* info = [NSDictionary dictionaryWithObject:@"Notification" forKey:@"Notification"];
    self.notification.userInfo = info;
    
    [[UIApplication sharedApplication]scheduleLocalNotification:self.notification];
}

- (void)stopNotification {
    NSString *myIDtoCancel  = @"Notification";
    UILocalNotification *notificationToCancel = nil;
    for (UILocalNotification *aNoti in [[UIApplication sharedApplication] scheduledLocalNotifications]) {
        if ([[aNoti.userInfo objectForKey:@"Notification"] isEqualToString:myIDtoCancel]) {
            notificationToCancel = aNoti;
            break;
        }
    }
    if (notificationToCancel) {
        [[UIApplication sharedApplication] cancelLocalNotification:notificationToCancel];
    }
}

- (void)start {
    self.isStarted = YES;
    [self startNotification];
    [self.timer invalidate];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:REFRESH_TIME target:self selector:@selector(elapse) userInfo:nil repeats:YES];
}

- (void)pause {
    self.isPaused = YES;
    [self stopNotification];
    [self.timer invalidate];
    self.timer = nil;
}

- (void)resume {
    self.isPaused = NO;
    [self startNotification];
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:REFRESH_TIME target:self selector:@selector(elapse) userInfo:nil repeats:YES];
    }
}

- (void)stop {
    self.isStarted = NO;
    [self stopNotification];
    [self.timer invalidate];
    self.timer =nil;
    [self updateSetting];
    [[SettingInfo sharedSettingInfo] modifiedHasUsed];
}

- (void)elapse {
    [self elapse:REFRESH_TIME];
    if (self.isFinshedCurrentState) {
        [self.timer invalidate];
        self.timer = nil;
    }
    [self.delegate elapse];
}

@end
