//
//  TimePickerViewController.m
//  TC
//
//  Created by kassol on 15/5/12.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import "TimePickerViewController.h"
#import "SettingInfo.h"
#import "SettingViewController.h"

@interface TimePickerViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *timePicker;
@property (nonatomic, strong)NSArray *pomodoroDurationTimes;
@property (nonatomic, strong)NSArray *shortBreakTimes;
@property (nonatomic, strong)NSArray *longBreakTimes;
@property (nonatomic, strong)NSArray *longBreakAfterTimes;

@end


@implementation TimePickerViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"SettingData" ofType:@"plist"];
    
    NSDictionary* dictonary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    self.pomodoroDurationTimes = [dictonary objectForKey:@"PomodoroDuration"];
    self.shortBreakTimes = [dictonary objectForKey:@"ShortBreak"];
    self.longBreakTimes = [dictonary objectForKey:@"LongBreak"];
    self.longBreakAfterTimes = [dictonary objectForKey:@"LongBreakAfter"];
    
    self.timePicker.delegate = self;
    self.timePicker.dataSource = self;
    
    if (self.selectedTableIndex == 0) {
        NSInteger row = [SettingInfo sharedSettingInfo].pomodoroDuration/5-1;
        [self.timePicker selectRow:row inComponent:0 animated:YES];
    } else if (self.selectedTableIndex == 1) {
        NSInteger row = [SettingInfo sharedSettingInfo].shortBreak-1;
        [self.timePicker selectRow:row inComponent:0 animated:YES];
    } else if (self.selectedTableIndex == 2) {
        NSInteger row = [SettingInfo sharedSettingInfo].longBreak/5-1;
        [self.timePicker selectRow:row inComponent:0 animated:YES];
    } else if (self.selectedTableIndex == 3) {
        NSInteger row = [SettingInfo sharedSettingInfo].longBreakAfter-2;
        [self.timePicker selectRow:row inComponent:0 animated:YES];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[(UIButton*)sender currentTitle]  isEqual: @"OK"]) {
        if (self.selectedTableIndex == 0) {
            [SettingInfo sharedSettingInfo].pomodoroDuration = [[self.pomodoroDurationTimes objectAtIndex:[self.timePicker selectedRowInComponent:0]] unsignedIntegerValue];
        } else if (self.selectedTableIndex == 1) {
            [SettingInfo sharedSettingInfo].shortBreak = [[self.shortBreakTimes objectAtIndex:[self.timePicker selectedRowInComponent:0]] unsignedIntegerValue];
        } else if (self.selectedTableIndex == 2) {
            [SettingInfo sharedSettingInfo].longBreak = [[self.longBreakTimes objectAtIndex:[self.timePicker selectedRowInComponent:0]] unsignedIntegerValue];
        } else if (self.selectedTableIndex == 3) {
            [SettingInfo sharedSettingInfo].longBreakAfter = [[self.longBreakAfterTimes objectAtIndex:[self.timePicker selectedRowInComponent:0]] unsignedIntegerValue];
        }
        
        SettingViewController* toView = segue.destinationViewController;
        [toView updateControls];
    }
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        if (self.selectedTableIndex == 0) {
            return [self.pomodoroDurationTimes count];
        } else if (self.selectedTableIndex == 1) {
            return [self.shortBreakTimes count];
        } else if (self.selectedTableIndex == 2) {
            return [self.longBreakTimes count];
        } else {
            return [self.longBreakAfterTimes count];
        }
    } else {
        return 1;
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        if (self.selectedTableIndex == 0) {
            return [[NSString alloc] initWithFormat:@"%@", [self.pomodoroDurationTimes objectAtIndex:row]];
        } else if (self.selectedTableIndex == 1) {
            return [[NSString alloc] initWithFormat:@"%@", [self.shortBreakTimes objectAtIndex:row]];
        } else if (self.selectedTableIndex == 2) {
            return [[NSString alloc] initWithFormat:@"%@", [self.longBreakTimes objectAtIndex:row]];
        } else {
            return [[NSString alloc] initWithFormat:@"%@", [self.longBreakAfterTimes objectAtIndex:row]];
        }
    } else {
        if (self.selectedTableIndex == 3) {
            return @"pomodoros";
        } else {
            return @"minutes";
        }
    }
}

- (UIView*)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel* label = (UILabel*)view;
    if (!label) {
        label = [[UILabel alloc] init];
        if (component == 0) {
            [label setTextColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]];
        } else {
            [label setTextColor:[UIColor colorWithRed:0.729 green:0.737 blue:0.702 alpha:1.0]];
        }
    }
    [label setTextAlignment:NSTextAlignmentCenter];
    label.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    return label;
}
@end
