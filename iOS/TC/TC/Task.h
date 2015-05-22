//
//  Task.h
//  TC
//
//  Created by kassol on 15/5/22.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

- (instancetype)initWithTaskName:(NSString *)taskName;
- (instancetype)initWithTaskName:(NSString *)taskName
                       expiredAt:(NSDate *)expireDate
                 withReserveTime:(float)reserveTime;
- (instancetype)initWithTaskName:(NSString *)taskName
                       expiredAt:(NSDate *)expireDate
                 withReserveTime:(float)reserveTime
                     isImportant:(BOOL)isImportant
                     isEmergency:(BOOL)isEmergency
                predictPomodoros:(NSInteger)predictPomodoros
                         withTag:(NSString *)tag
                   withExtraInfo:(NSString *)extraInfo;
- (void)addSubTask:(Task *)subTask;

@end
