//
//  ProViewController.m
//  TC
//
//  Created by kassol on 15/5/10.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import "ProViewController.h"
#import "CatalogTableViewCell.h"
#import "CatalogItem.h"
#import "Catalog.h"

@import Spring;



@interface ProViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mySearchField;
@property (weak, nonatomic) IBOutlet UITableView *myListView;
@property (weak, nonatomic) IBOutlet UIScrollView *myTaskBandView;
@property (weak, nonatomic) IBOutlet SpringButton *addButton;

@end

@implementation ProViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myListView.delegate = self;
    self.myListView.dataSource = self;
    self.myTaskBandView.contentSize = CGSizeMake(850.0, 140.0);
    self.mySearchField.returnKeyType = UIReturnKeySearch;
    self.mySearchField.delegate = self;
}

- (IBAction)addButtonDidTouch:(SpringButton *)sender {
    [self performSegueWithIdentifier:@"TouchAddButtonSegue" sender:self];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"%@", textField.text);
    [self.mySearchField resignFirstResponder];
    return YES;
}



- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[Catalog sharedCatalog] catalog] count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CatalogTableViewCell* cell = [self.myListView dequeueReusableCellWithIdentifier:@"TableCell"];
    CatalogItem* item = [[[Catalog sharedCatalog] catalog]  objectAtIndex:indexPath.row];
    cell.myFirstLabel.text = item.catalogName;
    cell.mySecondLabel.text = [[NSString alloc]initWithFormat:@"%li", (long)[item getTaskNum]];
    return cell;
}


@end
