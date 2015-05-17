//
//  ProgressView.m
//  TC
//
//  Created by kassol on 15/5/14.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#define REFRESH_TIME 0.04

#import "ProgressView.h"
#import "ProgressInfo.h"

@interface ProgressView ()

@property (nonatomic, strong)NSTimer *timer;
@property (nonatomic)BOOL finished;
@property (nonatomic)float drawedTime;
@property (nonatomic)float totalTime;

@end

@implementation ProgressView

- (void)drawRect:(CGRect)rect {
    
    if (self.finished) {
        return;
    }
    
    CGRect bounds = self.bounds;
    
    CGPoint center;
    center.x = bounds.origin.x+bounds.size.width/2.0;
    center.y = bounds.origin.y+bounds.size.height/2.0;
    
    float radius = bounds.size.width/2.0-10;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path addArcWithCenter:center radius:radius startAngle:0.5*M_PI endAngle:2.5*M_PI-self.drawedTime/self.totalTime*2*M_PI clockwise:YES];
    
    path.lineWidth = 5.0;
    [path setLineCapStyle:kCGLineCapRound];
    
    [[UIColor colorWithRed:55/255.0 green:101/255.0 blue:185/255.0 alpha:1.0] setStroke];
    
    [path stroke];
}

- (void)updateUI {
    if (self.drawedTime >= self.totalTime-0.1) {
        self.finished = YES;
        self.totalTime = [[ProgressInfo sharedProgressInfo] currentTotalTime];
        [self.timer invalidate];
        self.timer = nil;
        if (self.delegate) {
            [self.delegate timerViewDidFinishedTiming:self];
        }
    }
    if (self.finished) {
        self.drawedTime = 0;
    } else {
        self.drawedTime += REFRESH_TIME;
    }
    [self setNeedsDisplay];
}

- (void)start {
    [self.timer invalidate];
    self.finished = NO;
    self.drawedTime = 0;
    self.totalTime = [[ProgressInfo sharedProgressInfo] currentTotalTime];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:REFRESH_TIME target:self selector:@selector(updateUI)  userInfo:nil repeats:YES];
}

- (void)pause {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)stop {
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:REFRESH_TIME target:self selector:@selector(updateUI) userInfo:nil repeats:YES];
    }
    self.drawedTime = self.totalTime;
}

- (void)resume {
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:REFRESH_TIME target:self selector:@selector(updateUI) userInfo:nil repeats:YES];
    }
}

@end
