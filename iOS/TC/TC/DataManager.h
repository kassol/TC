//
//  DataManager.h
//  TC
//
//  Created by 张旭 on 15/5/19.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

+ (instancetype)sharedDataManager;

- (instancetype)init;

- (void)createEditableCopyOfDatabaseIfNeeded;

- (NSString*)applicationDocumentsDirectoryFile;

- (void)readData;

- (void)saveData;

@end
