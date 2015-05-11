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

@interface ProViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mySearchField;
@property (weak, nonatomic) IBOutlet UITableView *myListView;
@property (weak, nonatomic) IBOutlet UIScrollView *myTaskBandView;
@property (nonatomic, strong) NSMutableArray *catalogItems;

@end

@implementation ProViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.catalogItems = [[NSMutableArray alloc]init];
    [self.catalogItems addObject:[[CatalogItem alloc] initWithCatalogName:@"Inbox" andNum:50]];
    [self.catalogItems addObject:[[CatalogItem alloc] initWithCatalogName:@"Today" andNum:13]];
    [self.catalogItems addObject:[[CatalogItem alloc] initWithCatalogName:@"All" andNum:104]];
    [self.catalogItems addObject:[[CatalogItem alloc] initWithCatalogName:@"Done" andNum:26]];
    [self.catalogItems addObject:[[CatalogItem alloc] initWithCatalogName:@"List 1" andNum:7]];
    [self.catalogItems addObject:[[CatalogItem alloc] initWithCatalogName:@"List 2" andNum:89]];
    [self.catalogItems addObject:[[CatalogItem alloc] initWithCatalogName:@"List 3" andNum:35]];
    
    
    self.myListView.delegate = self;
    self.myListView.dataSource = self;
    self.myTaskBandView.contentSize = CGSizeMake(850.0, 140.0);
    self.mySearchField.returnKeyType = UIReturnKeySearch;
    self.mySearchField.delegate = self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"%@", textField.text);
    [self.mySearchField resignFirstResponder];
    return YES;
}

- (void)addCatalogWithName:(NSString*)name
                    andNum:(unsigned int)num {
    [self.catalogItems addObject:[[CatalogItem alloc] initWithCatalogName:name andNum:num]];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.catalogItems count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CatalogTableViewCell* cell = [self.myListView dequeueReusableCellWithIdentifier:@"TableCell"];
    CatalogItem* item = [self.catalogItems objectAtIndex:indexPath.row];
    cell.myFirstLabel.text = item.catalogName;
    cell.mySecondLabel.text = [[NSString alloc]initWithFormat:@"%i", item.numInCatalog];
    return cell;
}


@end
