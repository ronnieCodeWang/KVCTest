//
//  ViewController.m
//  KVCTest
//
//  Created by Sunell on 2018/11/2.
//  Copyright © 2018 Sunell. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()
{
    Person *p;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    p = [[Person alloc] init];
    [self test4];
    /**
     kvc给对象变量赋值流程：  setValue forKey
        通过setter方法给成员变量赋值，如果没有找到set方法，则会查看accessInstanceVariablesDirectly方法是否返回的YES，如果返回的NO，则直接调用forUndefinedKey方法，如果没有重写该方法，系统会奔溃
            如果返回的是YES，则会继续查找is<key> _key之类的成员变量，以及set<key>方法，都找不到就会调用forUndefinedKey方法，如果没有重写该方法，系统会奔溃
     取值流程： value ForKey
        查找get方法，如果查不到则查询get<key> is<key> <key>这些方法 ,如果都找不到则查找countOf<key> objectIn<Key>AtIndex或<Key>AtIndexes的方法，如果都找不到则会调用valueForUndefinedKey方法，如果没有重写该方法，系统会奔溃
     */
}

//keypath查找成员变量规则也是一样的，key isKey _key _isKey..
-(void)test4{
//    通过kvc中的keypath给p对象中的成员变量dog中的属性dogName赋值，也可以访问更深的路径
    [p setValue:@"小狗" forKeyPath:@"dog.dogName"];
//    keypath取值
    NSString *name = [p valueForKeyPath:@"dog.dogName"];
    NSLog(@"%@",name);
    
    //    通过kvc中的keypath给p对象中的成员变量dog中的成员变量_sex赋值
    [p setValue:@"男" forKeyPath:@"dog.sex"];
    NSString *sex = [p valueForKeyPath:@"dog.sex"];
    NSLog(@"%@",sex);
}

-(void)test3{
//    使用kvc取值，这里如果对象中没有该属性或成员变量，要想使这里成功可以在对象p中实现对应的方法也是可以的
//    如getTtt，ttt,isTtt，countOfTtt，的方法名
//    也就是说如果对象里面只写一个方法的实现，这个方法名按照kvc的规则定义的也可以通过kvc的方式访问到，有无返回值都可以
    [p valueForKey:@"ttt"];
//    NSLog(@"%@",gg);
}

-(void)test2{
    //    通过kvc访问p对象的成员变量,前提是accessInstanceVariablesDirectly方法是返回的YES，不然访问不了
    [p setValue:@"rrr" forKey:@"abc"];
    NSString *gg = [p valueForKey:@"abc"];
    NSLog(@"%@",gg);
}

-(void)test1{
    p.pname = @"小明";
    NSLog(@"%@",p);
    
//    通过kvc间接访问p对象的属性pname，进行赋值，也会调用该属性的set方法
    [p setValue:@"小红" forKey:@"pname"];
    //    通过kvc进行取值，也会调用get方法
    NSString *dd = [p valueForKey:@"pname"];
    NSLog(@"%@",dd);
    
//    如果赋值的属性不存在就会报错，在对象p中重写forUndefinedKey方法可以避免报错
    [p setValue:@"小刚" forKey:@"www"];
//    同样取值的key不存在也需要重写valueForUndefinedKey方法
    NSString *ww = [p valueForKey:@"www"];
    NSLog(@"%@",ww);
    
    [p setValue:nil forKey:@"pname"];
}

@end
