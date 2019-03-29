//
//  Person.m
//  KVCTest
//
//  Created by Sunell on 2018/11/2.
//  Copyright © 2018 Sunell. All rights reserved.
//

#import "Person.h"
#import "Dog.h"

@implementation Person

{
    NSString *abc;
    Dog *dog;
    int bcd;
}

-(instancetype)init{
    if (self == [super init]) {
        dog = [[Dog alloc] init];
    }
    return self;
}

- (NSString *)name{
    return _pname;
}

- (void)setPname:(NSString *)pname{
    _pname = pname;
}

-(NSUInteger)countOfAge{
    return _age;
}

-(void)ttt{
    NSLog(@"ttttttt");
//    return @"谁先";
}

//-(NSString *)getTtt{
//    return @"好的";
//}


-(NSString *)description{
    return [NSString stringWithFormat:@"name:%@,age:%d,sex:%@",_pname,_age,_sex];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"通过kvc赋值时找不到对应的key会调用这里，如果不重写该方法，系统默认是奔溃的");
}

-(id)valueForUndefinedKey:(NSString *)key{
    NSLog(@"取值时找不到对应的key会走这里，不重写会奔溃");
    return nil;
}

-(void)setNilValueForKey:(NSString *)key{
    NSLog(@"通过kvc赋值，给key赋值的是nil就会走这个方法，不重写也会奔溃");
}

+(BOOL)accessInstanceVariablesDirectly{
    return YES;
}

@end
