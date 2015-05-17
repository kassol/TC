//
//  ProgressView.h
//  TC
//
//  Created by kassol on 15/5/14.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ProgressView;

@protocol ProgressViewDelegate <NSObject>

@required
- (void) timerViewDidFinishedTiming:(ProgressView*)TimerView;

@end

@interface ProgressView : UIView

@property (nonatomic, strong) id<ProgressViewDelegate> delegate;

- (void)start;

- (void)pause;

- (void)stop;

- (void)resume;

@end
