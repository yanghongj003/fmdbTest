//
//  ViewController.m
//  FmdbTest
//
//  Created by tom on 15/3/31.
//  Copyright (c) 2015年 tom. All rights reserved.


#import "ViewController.h"
#import "Person.h"
#import "dataBaseTool.h"

@interface ViewController ()
@end

@implementation ViewController

- (IBAction)addPerson{
  
    for (int i=0; i<15; i++) {
        Person *p = [[Person alloc]init];
        p.name = [NSString stringWithFormat:@"yang_%d",i];
        p.age = i;
        BOOL b = [dataBaseTool addPerson:p];
        if (b) {
            NSLog(@"添加成功");
        }
    }
}

- (IBAction)deletePerson{
    
    Person *p = [[Person alloc]init];
    p.name = @"yang_4";
    BOOL b = [dataBaseTool deletePerson:p];
    if (b) {
        NSLog(@"删除数据成功");
    }
}
- (IBAction)queryPerosn{
    
    NSArray *result  = [dataBaseTool queryPersonWithName:@"yang"];
    
    if (result.count>0) {
        
        for (Person *p in result) {
            NSLog(@"%@",p);
        }
    }
    else
        NSLog(@"查询结果为空");

}
- (IBAction)updatePerson{
    
    Person *newP =[[Person alloc]init];
    newP.name = @"yang_55";
    newP.age = 100;
    
    Person *oldP = [[Person alloc]init];
    oldP.name = @"yang_5";
    BOOL b = [dataBaseTool updateNewPerson:newP withOldPerson:oldP];
    if (b) {
        NSLog(@"更新数据成功");
    }
}
@end
