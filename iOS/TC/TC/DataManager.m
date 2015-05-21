//
//  DataManager.m
//  TC
//
//  Created by 张旭 on 15/5/19.
//  Copyright (c) 2015年 3lang. All rights reserved.
//

#import "DataManager.h"
#import "SettingInfo.h"

@implementation DataManager

static DataManager *dataManagerInstance = nil;

+ (instancetype)sharedDataManager {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        dataManagerInstance = [[self alloc]init];
        [dataManagerInstance createEditableCopyOfDatabaseIfNeeded];
    });
    return dataManagerInstance;
}

- (instancetype)init {
    self = [super init];
    return self;
}

- (void)createEditableCopyOfDatabaseIfNeeded {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *writableDBPath = [self applicationDocumentsDirectoryFile];
    
    BOOL dbexits = [fileManager fileExistsAtPath:writableDBPath];
    
    if (!dbexits) {
        NSString * defaultDBPath = [[NSBundle mainBundle] pathForResource:@"Setting" ofType:@"plist"];
        
        NSError *error;
        BOOL success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
        if (!success) {
            NSLog(@"copy failed");
        }
    }
}

- (NSString *)applicationDocumentsDirectoryFile {
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"Setting.plist"];
    return path;
}

- (void)readData {
    NSString *path = [self applicationDocumentsDirectoryFile];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    [SettingInfo sharedSettingInfo].pomodoroDuration = [(NSNumber*)[dict objectForKey:@"PomodoroDuration"] unsignedIntegerValue];
    [SettingInfo sharedSettingInfo].shortBreak = [(NSNumber*)[dict objectForKey:@"ShortBreak"] unsignedIntegerValue];
    [SettingInfo sharedSettingInfo].longBreak = [(NSNumber*)[dict objectForKey:@"LongBreak"] unsignedIntegerValue];
    [SettingInfo sharedSettingInfo].longBreakAfter = [(NSNumber*)[dict objectForKey:@"LongBreakAfter"] unsignedIntegerValue];
}

- (void)saveData {
    NSString *path = [self applicationDocumentsDirectoryFile];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithUnsignedLong:[SettingInfo sharedSettingInfo].pomodoroDuration] forKey:@"PomodoroDuration"];
    [dict setValue:[NSNumber numberWithUnsignedLong:[SettingInfo sharedSettingInfo].shortBreak] forKey:@"ShortBreak"];
    [dict setValue:[NSNumber numberWithUnsignedLong:[SettingInfo sharedSettingInfo].longBreak] forKey:@"LongBreak"];
    [dict setValue:[NSNumber numberWithUnsignedLong:[SettingInfo sharedSettingInfo].longBreakAfter] forKey:@"LongBreakAfter"];
    
    [dict writeToFile:path atomically:YES];
}

@end
