//
//  TimePickerViewController.h
//  TC
//
//  Created by kassol on 15/5/12.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimePickerViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic)NSInteger selectedTableIndex;

@end
