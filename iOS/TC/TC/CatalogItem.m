//
//  CatalogObject.m
//  TC
//
//  Created by kassol on 15/5/11.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import "CatalogItem.h"
#import "Task.h"

@interface CatalogItem ()
@property (nonatomic, strong) NSMutableArray *taskList;
@end

@implementation CatalogItem

- (instancetype)initWithCatalogName:(NSString *)name andNum:(NSUInteger)num {
    self.catalogName = name;
    self.numInCatalog =  num;
    return self;
}

- (void)addTask {
}

@end
