//
//  CatalogObject.m
//  TC
//
//  Created by kassol on 15/5/11.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import "CatalogItem.h"

@implementation CatalogItem

- (instancetype)initWithCatalogName:(NSString *)name andNum:(unsigned int)num {
    self.catalogName = name;
    self.numInCatalog =  num;
    return self;
}

@end
