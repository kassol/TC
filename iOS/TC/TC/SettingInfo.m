//
//  SettingInfo.m
//  TC
//
//  Created by kassol on 15/5/12.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import "SettingInfo.h"

@interface SettingInfo ()
@property (nonatomic, readwrite)BOOL isModified;
@end

@implementation SettingInfo

static SettingInfo *settingInfoInstance = nil;

- (instancetype)init {
    self = [super init];
    self.pomodoroDuration = 25;
    self.shortBreak = 5;
    self.longBreak = 15;
    self.longBreakAfter = 4;
    self.isModified = NO;
    return self;
}

+ (instancetype)sharedSettingInfo {
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        settingInfoInstance = [[self alloc] init];
        
    });
    
    return settingInfoInstance;
}

- (void)setPomodoroDuration:(NSUInteger)pomodoroDuration {
    if (self.pomodoroDuration != pomodoroDuration) {
        self.isModified = YES;
    }
    _pomodoroDuration =  pomodoroDuration;
}

- (void)setShortBreak:(NSUInteger)shortBreak {
    if (self.shortBreak != shortBreak) {
        self.isModified = YES;
    }
    _shortBreak = shortBreak;
}

- (void)setLongBreak:(NSUInteger)longBreak {
    if (self.longBreak != longBreak) {
        self.isModified = YES;
    }
    _longBreak = longBreak;
}

- (void)setLongBreakAfter:(NSUInteger)longBreakAfter {
    if (self.longBreakAfter != longBreakAfter) {
        self.isModified = YES;
    }
    _longBreakAfter = longBreakAfter;
}

- (void)modifiedHasUsed {
    self.isModified = NO;
}

@end
