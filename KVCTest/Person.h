//
//  Person.h
//  KVCTest
//
//  Created by Sunell on 2018/11/2.
//  Copyright © 2018 Sunell. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property(nonatomic,copy)NSString *pname;

@property(nonatomic,copy)NSString *sex;

@property(nonatomic,assign)int age;

@end

NS_ASSUME_NONNULL_END
