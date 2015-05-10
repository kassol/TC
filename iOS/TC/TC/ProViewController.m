//
//  ProViewController.m
//  TC
//
//  Created by kassol on 15/5/10.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import "ProViewController.h"

@interface ProViewController ()
@property (weak, nonatomic) IBOutlet UITableView *myListView;

@end

@implementation ProViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _myListView.delegate = self;
    _myListView.dataSource = self;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [_myListView dequeueReusableCellWithIdentifier:@"TableCell"];
    return cell;
}

@end
