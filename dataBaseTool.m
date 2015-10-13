//
//  dataBaseTool.m
//  FmdbTest
//
//  Created by tom on 15/3/31.
//  Copyright (c) 2015年 tom. All rights reserved.
//

#import "dataBaseTool.h"

#define KdbName @"person.sqlite"
#define kLimit 5
static FMDatabaseQueue *_dbQueue;

@implementation dataBaseTool

+ (void)initialize
{
     NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:KdbName];
     NSLog(@"%@",path);
     _dbQueue = [FMDatabaseQueue databaseQueueWithPath:path];
     // 线程安全的
     [_dbQueue inDatabase:^(FMDatabase *db) {
        BOOL p = [db executeUpdate:@"create table if not exists t_person (user_id integer primary key autoincrement ,name text,age integer);"];
        if (p) {
            NSLog(@"person创建成功");
        }
        else
        {
            NSLog(@"person创建失败");
        }
         BOOL d = [db executeUpdate:@"create table if not exists t_dog (user_id integer primary key autoincrement ,name text,age integer);"];
         if (d) {
             NSLog(@"狗表创建成功");
         }
         else
             NSLog(@"狗表创建失败");
    }];
}

+ (BOOL)addPerson:(Person *)p{
   
    __block  BOOL b = NO;
    // 线程安全的
    [_dbQueue inDatabase:^(FMDatabase *db) {
      b = [db executeUpdate:@"insert into t_person (name,age) values(?,?);",p.name,@(p.age)];
    }];
    return b;
}

+ (BOOL)updateNewPerson:(Person*)newP withOldPerson:(Person*)oldP{
  
    __block  BOOL b = NO;
    // 线程安全的
    [_dbQueue inDatabase:^(FMDatabase *db) {
        b = [db executeUpdate:@"update t_person set name = ?,age = ? where name = ?;",newP.name,@(newP.age),oldP.name];
    }];
    return b;
}
+ (NSArray *)queryPersonWithName:(NSString*)name
{
    __block  NSMutableArray *result = nil;
    // 线程安全的
    [_dbQueue inDatabase:^(FMDatabase *db) {
        NSString *fuzzy = [NSString stringWithFormat:@"%%%@%%",name];
        FMResultSet  *set = [db executeQuery:@"select * from t_person where name like ? order by age asc limit ?;",fuzzy,@(kLimit)];
        result = [NSMutableArray arrayWithCapacity:[set columnCount]];
        while ([set next])
        {
            Person *p = [[Person alloc]init];
            p.user_id = [set intForColumn:@"user_id"];
            p.name = [set stringForColumn:@"name"];
            p.age = [set intForColumn:@"age"];
            [result addObject:p];
        }
    }];
   return result;
}
+ (BOOL)deletePerson:(Person *)p
{
    __block  BOOL b = NO;
    // 线程安全的
    [_dbQueue inDatabase:^(FMDatabase *db) {
        b = [db executeUpdate:@"delete from t_person where name =?;",p.name];
    }];
    return b;
}
@end
