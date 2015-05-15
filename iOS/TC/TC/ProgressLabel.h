//
//  ProgressLabel.h
//  TC
//
//  Created by kassol on 15/5/14.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressLabel : UILabel

@property (nonatomic) float totalTime;

- (void)start;

- (void)pause;

- (void)stop;

- (void)resume;

@end