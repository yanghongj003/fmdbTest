//
//  Person.m
//  FmdbTest
//
//  Created by tom on 15/3/31.
//  Copyright (c) 2015年 tom. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)description
{

  return [NSString stringWithFormat:@"姓名：%@--年龄：%d--用户id:%d",self.name,self.age,self.user_id];
   
}
@end
