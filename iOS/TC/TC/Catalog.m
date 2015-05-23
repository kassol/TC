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
    
    [self.catalog addObject:[[CatalogItem alloc] initWithCatalogName:@"Inbox"]];
    [self.catalog addObject:[[CatalogItem alloc] initWithCatalogName:@"Today"]];
    [self.catalog addObject:[[CatalogItem alloc] initWithCatalogName:@"All"]];
    [self.catalog addObject:[[CatalogItem alloc] initWithCatalogName:@"Done"]];
    
    return self;
}

+ (instancetype)sharedCatalog {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        cataInstance = [[self alloc] init];
    });
    
    return cataInstance;
}

- (void)addCatalogItem:(CatalogItem *)catalogItem {
    [self.catalog addObject:catalogItem];
}

@end
