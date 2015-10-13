//
//  dataBaseTool.h
//  FmdbTest
//
//  Created by tom on 15/3/31.
//  Copyright (c) 2015年 tom. All rights reserved.
//  1:数据库的线程安全 2:数据库的事务处理

#import "FMDB.H"
#import "Person.h"
@interface dataBaseTool : NSObject

/**
 *  添加person对象到数据库
 *
 *  @param p person对象
 *
 *  @return 是否成功添加的标记
 */
+ (BOOL)addPerson:(Person *)p;

/**
 *  更新person对象纪录
 *
 *  @param p person对象
 *
 *  @return 是否更新成功的标记
 */
+ (BOOL)updateNewPerson:(Person*)newP withOldPerson:(Person*)oldP;

/**
 *  用名字查询person
 *
 *  @param name person 名字
 *
 *  @return person对象数组
 */
+ (NSArray *)queryPersonWithName:(NSString*)name;

/**
 *  删除person对象记录
 *
 *  @param p person对象
 *
 *  @return 是否删除成功的标记
 */

+ (BOOL)deletePerson:(Person *)p;

@end
