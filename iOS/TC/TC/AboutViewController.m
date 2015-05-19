//
//  AboutViewController.m
//  TC
//
//  Created by 张旭 on 15/5/19.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import "AboutViewController.h"
@import Spring;

@interface AboutViewController ()
@property (weak, nonatomic) IBOutlet SpringImageView *aboutCard;

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)backButtonDidTouch:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)authorButtonDidTouch:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://weibo.com/kassol"]];
}

@end
