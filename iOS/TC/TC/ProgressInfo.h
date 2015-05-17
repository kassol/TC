//
//  ProgressInfo.h
//  TC
//
//  Created by kassol on 15/5/17.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProgressInfo : NSObject

+ (instancetype)sharedProgressInfo;

- (instancetype)init;

- (void)nextState;

- (float)currentTotalTime;

- (void)updateSetting;

@end
