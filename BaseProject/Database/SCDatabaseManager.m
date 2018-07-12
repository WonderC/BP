//
//  SCDatabaseManager.m
//  BaseProject
//
//  Created by wonderC on 2017/2/10.
//  Copyright © 2017年 wonderC. All rights reserved.
//

#import "SCDatabaseManager.h"
static FMDatabaseQueue *queue;

/**
 创建数据库路径

 @param path 文件路径
 @return 返回一个路径
 */
static inline NSString *createDatabasePath(NSString *path){
    
    NSString *databasePath = [path stringByAppendingPathComponent:@"/DataBase"];
    BOOL isDirectory;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL existed = [fileManager fileExistsAtPath:databasePath isDirectory:&isDirectory];
    
    //判断是不是存在路径文件
    if (!existed || !isDirectory ) {
        //创建路径
        [fileManager createDirectoryAtPath:databasePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return nil;
}

@implementation SCDatabaseManager

/**
 创建数据库
 */
+ (void)initDatabase{
    
    NSString *rootPath = [UIApplication sharedApplication].libraryPath;
    NSString *databasePath = [createDatabasePath(rootPath) stringByAppendingString:@"database.db"];
    queue = [FMDatabaseQueue databaseQueueWithPath:databasePath];
    
    [queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"create table if not exists MyMessageCustomer (id integer primary key autoincrement,messageId text,myid text,messageCustom blob);"];//客户动态表
        [db setShouldCacheStatements:YES];//数据库缓存，提高查询效率
    }];

}

+ (NSArray *)selectAllData{
    
    [self initDatabase];
    __block NSMutableArray *mutableArray = [NSMutableArray array];
    [queue inDatabase:^(FMDatabase *db) {
        FMResultSet *rs = [db executeQuery:@"select * from MyMessageCustomer order by messageTime desc"];
        while (rs.next) {
            [mutableArray addObject:@"model"];
        }
    }];
    [queue close];
    return mutableArray;
}

+ (void)insertOneRecordWithModel:(NSObject *)model{
    
    [self initDatabase];
    [queue inDatabase:^(FMDatabase *db) {
        FMResultSet *rs = [db  executeQuery:@"select count(*) from MyMessageCustomer where postTime = ?;",model];
        if (rs.columnCount) {
            
            [rs close];
        }else{
            
            [rs close];
            [db executeUpdate:@"insert into MyMessageCustomer (postName,postContent,postTime,messageTime) values(?,?,?,?)",model,model,model,model];
            SCLog(@"insert compelete");
        }
    }];
    [queue close];
}

+(void)insertOneRecordWithDictionary:(NSDictionary *)dictionary{
    
    id model = [NSObject modelWithDictionary:dictionary];
    [self insertOneRecordWithModel:model];
}

+ (void)deleteAllRecords{
    
    [self initDatabase];
    [queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"delete from MyMessageCustomer"];
    }];
    
}

@end
