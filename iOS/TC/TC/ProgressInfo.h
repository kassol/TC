//
//  ProgressInfo.h
//  TC
//
//  Created by kassol on 15/5/17.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ProgressDelegate <NSObject>

@required

- (void)elapse;

@end

@interface ProgressInfo : NSObject

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) float totalTime;
@property (nonatomic) float elapseTime;
@property (nonatomic) BOOL isFinshedCurrentState;
@property (nonatomic) NSDate *backgroundTimeStamp;
@property (nonatomic, strong) id<ProgressDelegate> delegate;
@property (nonatomic) BOOL isStarted;
@property (nonatomic) BOOL isPaused;

+ (instancetype)sharedProgressInfo;

- (instancetype)init;

- (void)elapse:(float)elapseTime;

- (void)nextState;

- (float)currentTotalTime;

- (void)updateSetting;

- (void)restoreState;

- (void)startNotification;

- (void)stopNotification;

- (void)start;

- (void)pause;

- (void)resume;

- (void)stop;

@end
