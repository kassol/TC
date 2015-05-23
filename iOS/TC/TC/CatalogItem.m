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

- (instancetype)initWithCatalogName:(NSString *)name {
    self = [super init];
    self.catalogName = name;
    return  self;
}

- (void)addTask:(Task *)task {
    [self.taskList addObject:task];
}

- (NSInteger)getTaskNum {
    return [self.taskList count];
}

@end
