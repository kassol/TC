//
//  SettingInfo.m
//  TC
//
//  Created by kassol on 15/5/12.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import "SettingInfo.h"

@implementation SettingInfo

static SettingInfo *settingInfoInstance = nil;

- (instancetype)init {
    self = [super init];
    self.pomodoroDuration = 25;
    self.shortBreak = 5;
    self.longBreak = 15;
    self.longBreakAfter = 4;
    
    return self;
}

+ (instancetype)sharedSettingInfo {
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        settingInfoInstance = [[self alloc] init];
    });
    
    return settingInfoInstance;
}

@end
