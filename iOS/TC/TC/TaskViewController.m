//
//  TaskViewController.m
//  TC
//
//  Created by kassol on 15/5/27.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import "TaskViewController.h"
#import "SubTaskTableViewCell.h"

@interface TaskViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITableView *subtaskTableView;
@property (weak, nonatomic) IBOutlet UITableView *predictTableView;
@property (weak, nonatomic) IBOutlet UITextField *taskNameTextField;

@end

@implementation TaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect bounds = self.view.bounds;
    
    self.scrollView.contentSize = CGSizeMake(bounds.size.width, 700);
    self.subtaskTableView.delegate = self;
    self.subtaskTableView.dataSource = self;
    self.taskNameTextField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SubTaskTableViewCell *cell = [self.subtaskTableView dequeueReusableCellWithIdentifier:@"SubTaskCell"];
    cell.taskNameField.text = @"Xiamen";
    return  cell;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.taskNameTextField resignFirstResponder];
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
