//
//  SettingInfo.h
//  TC
//
//  Created by kassol on 15/5/12.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingInfo : NSObject

@property (nonatomic)NSUInteger pomodoroDuration;
@property (nonatomic)NSUInteger shortBreak;
@property (nonatomic)NSUInteger longBreak;
@property (nonatomic)NSUInteger longBreakAfter;
@property (nonatomic, readonly)BOOL isModified;

+ (instancetype)sharedSettingInfo;

- (void)setPomodoroDuration:(NSUInteger)pomodoroDuration;
- (void)setShortBreak:(NSUInteger)shortBreak;
- (void)setLongBreak:(NSUInteger)longBreak;
- (void)setLongBreakAfter:(NSUInteger)longBreakAfter;

- (void)modifiedHasUsed;

@end
