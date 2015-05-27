//
//  SubTaskTableViewCell.h
//  TC
//
//  Created by kassol on 15/5/27.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubTaskTableViewCell : UITableViewCell <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *checkButton;
@property (weak, nonatomic) IBOutlet UITextField *taskNameField;

@end
