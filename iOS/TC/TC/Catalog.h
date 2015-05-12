//
//  Catalog.h
//  TC
//
//  Created by kassol on 15/5/12.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Catalog : NSObject

@property (nonatomic, strong) NSMutableArray *catalog;

+ (instancetype)sharedCatalog;

@end
