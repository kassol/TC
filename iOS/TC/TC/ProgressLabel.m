//
//  ProgressLabel.m
//  TC
//
//  Created by kassol on 15/5/14.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#define REFRESH_TIME 0.04

#import "ProgressLabel.h"
#import "ProgressInfo.h"

@implementation ProgressLabel


- (void)updateUI {
    int currentMinute = (int)([ProgressInfo sharedProgressInfo].totalTime-[ProgressInfo sharedProgressInfo].elapseTime)/60;
    int currentSecond = (int)([ProgressInfo sharedProgressInfo].totalTime-[ProgressInfo sharedProgressInfo].elapseTime)%60;
    [self setText:[[NSString alloc] initWithFormat:@"%i:%02i", currentMinute, currentSecond]];
}

@end
