//
//  Catalog.m
//  TC
//
//  Created by kassol on 15/5/12.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import "Catalog.h"
#import "CatalogItem.h"

@implementation Catalog

static Catalog *cataInstance = nil;

- (instancetype)init {
    self = [super init];
    
    self.catalog = [[NSMutableArray alloc]init];
    
    [self.catalog addObject:[[CatalogItem alloc] initWithCatalogName:@"Inbox" andNum:0]];
    [self.catalog addObject:[[CatalogItem alloc] initWithCatalogName:@"Today" andNum:0]];
    [self.catalog addObject:[[CatalogItem alloc] initWithCatalogName:@"All" andNum:0]];
    [self.catalog addObject:[[CatalogItem alloc] initWithCatalogName:@"Done" andNum:0]];
    [self.catalog addObject:[[CatalogItem alloc] initWithCatalogName:@"List 1" andNum:0]];
    [self.catalog addObject:[[CatalogItem alloc] initWithCatalogName:@"List 2" andNum:0]];
    [self.catalog addObject:[[CatalogItem alloc] initWithCatalogName:@"List 3" andNum:0]];
    
    return self;
}

+ (instancetype)sharedCatalog {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        cataInstance = [[self alloc] init];
    });
    
    return cataInstance;
}

@end
