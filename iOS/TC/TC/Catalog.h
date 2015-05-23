//
//  Catalog.h
//  TC
//
//  Created by kassol on 15/5/12.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CatalogItem;

@interface Catalog : NSObject
@property (nonatomic, strong) NSMutableArray *catalog;

+ (instancetype)sharedCatalog;

- (void)addCatalogItem:(CatalogItem *)catalogItem;

@end
