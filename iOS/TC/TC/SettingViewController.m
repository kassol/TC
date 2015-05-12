//
//  SettingViewController.m
//  TC
//
//  Created by kassol on 15/5/12.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingTableViewCell.h"
#import "SettingInfo.h"

@interface SettingViewController ()
@property (weak, nonatomic) IBOutlet UITableView *settingTableView;
@property (nonatomic, strong)NSArray *settingLabelHeaders;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.settingLabelHeaders = @[@"Pomodoro Duration", @"Short Break", @"Long Break", @"Long Break After"];
    self.settingTableView.delegate = self;
    self.settingTableView.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.settingLabelHeaders count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SettingTableViewCell* cell = [self.settingTableView dequeueReusableCellWithIdentifier:@"SettingTableCell"];
    cell.firstLabel.text = [self.settingLabelHeaders objectAtIndex:indexPath.row];
    switch (indexPath.row) {
        case 0:
            cell.secondLabel.text = [[NSString alloc]initWithFormat:@"%lu minutes", (unsigned long)[[SettingInfo sharedSettingInfo] pomodoroDuration]];
            break;
        case 1:
            cell.secondLabel.text = [[NSString alloc]initWithFormat:@"%lu minutes", (unsigned long)[[SettingInfo sharedSettingInfo] shortBreak]];
            break;
        case 2:
            cell.secondLabel.text = [[NSString alloc]initWithFormat:@"%lu minutes", (unsigned long)[[SettingInfo sharedSettingInfo] longBreak]];
            break;
        case 3:
            cell.secondLabel.text = [[NSString alloc]initWithFormat:@"%lu pomodoros", (unsigned long)[[SettingInfo sharedSettingInfo] longBreakAfter]];
            break;
        default:
            break;
    }
    return cell;
}

@end
