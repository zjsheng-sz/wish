//
//  BaseModel.h
//  Runtime
//
//  Created by autel on 17/6/3.
//  Copyright © 2017年 zhongjiasheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GWBaseModel : NSObject


/**
 获得该类的所有实例

 @return 实例名称数组
 */
- (NSArray *)getAllInstanceName;


/**
 获得该类的所有属性

 @return 属性名称数组
 */
- (NSArray *)getAllPropertiesName;

/**
 获得该类的所有方法
 
 @return 方法名称数组
 */
- (NSArray *)getAllMethods;


- (NSArray *)getAllMethodsForSwizzling;

- (void)association;

@end
