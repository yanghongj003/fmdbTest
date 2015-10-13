//
//  Person.h
//  FmdbTest
//
//  Created by tom on 15/3/31.
//  Copyright (c) 2015年 tom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic,assign)int user_id;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,assign)int age;
@end
