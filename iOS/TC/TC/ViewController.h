//
//  ViewController.h
//  TC
//
//  Created by 张旭 on 15/4/22.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgressView.h"
#import "ProgressInfo.h"

@interface ViewController : UIViewController<UIAlertViewDelegate, ProgressDelegate>


- (void)updateSettings;

@end

