//
//  CatalogObject.h
//  TC
//
//  Created by kassol on 15/5/11.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CatalogItem : NSObject

@property (nonatomic, strong)NSString* catalogName;
@property (nonatomic)NSUInteger numInCatalog;

- (instancetype)initWithCatalogName:(NSString*)name
                     andNum:(NSUInteger)num;

- (void)addTask;

@end
