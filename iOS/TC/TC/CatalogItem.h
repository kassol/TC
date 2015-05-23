//
//  CatalogObject.h
//  TC
//
//  Created by kassol on 15/5/11.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Task;

@interface CatalogItem : NSObject

@property (nonatomic, strong)NSString* catalogName;

- (instancetype)initWithCatalogName:(NSString *)name;

- (void)addTask:(Task *)task;

- (NSInteger)getTaskNum;

@end
