//
//  Task.m
//  TC
//
//  Created by kassol on 15/5/22.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import "Task.h"

@interface Task ()
@property (nonatomic, strong) NSString *taskName;
@property (nonatomic) BOOL isImportant;
@property (nonatomic) BOOL isEmergency;
@property (nonatomic, strong) NSDate *expireDate;
@property (nonatomic) float reserveTime;
@property (nonatomic) NSInteger predictPomodoros;
@property (nonatomic) NSInteger donePomodoros;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSString *extraInfo;
@property (nonatomic, strong) NSMutableArray *subTasks;
@end

@implementation Task

- (instancetype)initWithTaskName:(NSString *)taskName {
    self.taskName = taskName;
    return self;
}

- (instancetype)initWithTaskName:(NSString *)taskName
                       expiredAt:(NSDate *)expireDate
                 withReserveTime:(float)reserveTime {
    self = [self initWithTaskName:taskName];
    self.expireDate = expireDate;
    self.reserveTime = reserveTime;
    return self;
}

- (instancetype)initWithTaskName:(NSString *)taskName
                       expiredAt:(NSDate *)expireDate
                 withReserveTime:(float)reserveTime
                     isImportant:(BOOL)isImportant
                     isEmergency:(BOOL)isEmergency
                predictPomodoros:(NSInteger)predictPomodoros
                         withTag:(NSString *)tag
                   withExtraInfo:(NSString *)extraInfo {
    self = [self initWithTaskName:taskName expiredAt:expireDate withReserveTime:reserveTime];
    self.isImportant = isImportant;
    self.isEmergency = isEmergency;
    self.predictPomodoros = predictPomodoros;
    self.tag = tag;
    self.extraInfo = tag;
    return self;
}

- (void)addSubTask:(Task *)subTask {
    [self.subTasks addObject:subTask];
}

@end
