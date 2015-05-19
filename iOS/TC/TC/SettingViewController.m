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
#import "TimePickerViewController.h"
#import "ProgressInfo.h"
#import "ViewController.h"

@interface SettingViewController ()
@property (nonatomic, strong)NSArray *settingLabelHeaders;
@property (weak, nonatomic) IBOutlet UITableView *settingTableView;

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

- (IBAction)aboutButtonDidTouch:(id)sender {
    [self performSegueWithIdentifier:@"AboutSegue" sender:self];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [self performSegueWithIdentifier:@"SettingDetailSegue" sender:[self.settingTableView cellForRowAtIndexPath:indexPath]];
    
    [self.settingTableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual: @"SettingDetailSegue"]) {
        TimePickerViewController* toView = segue.destinationViewController;
        toView.selectedTableIndex = [self.settingTableView indexPathForCell:(SettingTableViewCell *)sender].row;
    } else {
        if ([segue.destinationViewController respondsToSelector:@selector(updateSettings)]) {
            ViewController* toView = segue.destinationViewController;
            [toView updateSettings];
        }
    }
}

- (void)updateControls {
    if ([SettingInfo sharedSettingInfo].isModified) {
        [self.settingTableView reloadData];
    }
}

@end
