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

@implementation ProgressView

- (void)drawRect:(CGRect)rect {
    
    CGRect bounds = self.bounds;
    
    CGPoint center;
    center.x = bounds.origin.x+bounds.size.width/2.0;
    center.y = bounds.origin.y+bounds.size.height/2.0;
    
    float radius = bounds.size.width/2.0-10;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path addArcWithCenter:center radius:radius startAngle:0.5*M_PI endAngle:2.5*M_PI-[ProgressInfo sharedProgressInfo].elapseTime/[ProgressInfo sharedProgressInfo].totalTime*2*M_PI clockwise:YES];
    
    path.lineWidth = 5.0;
    [path setLineCapStyle:kCGLineCapRound];
    
    [[UIColor colorWithRed:55/255.0 green:101/255.0 blue:185/255.0 alpha:1.0] setStroke];
    
    [path stroke];
}

@end
