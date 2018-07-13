//
//  SCDatabaseManager.h
//  BaseProject
//
//  Created by wonderC on 2017/2/10.
//  Copyright © 2017年 wonderC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCDatabaseManager : NSObject

/**
 查询表中所有的数据

 @return 返回数组
 */
+ (NSArray *)selectAllData;

/**
 插入一条记录

 @param model 数据模型
 */
+ (void)insertOneRecordWithModel:(NSObject *)model;

/**
 插入一条记录

 @param dictionary 数据字典
 */
+ (void)insertOneRecordWithDictionary:(NSDictionary *)dictionary;

/**
 删除所有的记录
 */
+ (void)deleteAllRecords;

@end
