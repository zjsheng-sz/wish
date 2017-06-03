//
//  BaseModel.m
//  Runtime
//
//  Created by autel on 17/6/3.
//  Copyright © 2017年 zhongjiasheng. All rights reserved.
//

#import "GWBaseModel.h"
#import <objc/runtime.h>

@implementation GWBaseModel

- (instancetype)init{
    
    if (self = [super init]) {
        [self swizzing];
    }

    return self;
}

- (NSArray *)getAllInstanceName{

    NSMutableArray *mArray = [NSMutableArray array];
    
    u_int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        
        const char *ivarName = ivar_getName(ivars[i]);
        
        NSString *str = [NSString stringWithCString:ivarName encoding:NSUTF8StringEncoding];
        
        [mArray addObject:str];
    }
    
    free(ivars);
    
    return [mArray copy];
    
}

- (NSArray *)getAllPropertiesName{

    NSMutableArray *mArray = [NSMutableArray array];
    
    u_int count = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    for (int i = 0; i < count; i ++) {
        
        const char *propertyName = property_getName(properties[i]);
        
        NSString *str = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
        
        [mArray addObject:str];
    }
    
    free(properties);
    
    return [mArray copy];

}


- (NSArray *)getAllMethods{
    
    NSMutableArray *mArray = [NSMutableArray array];
    
    u_int count = 0;
    Method *methods = class_copyMethodList([self class], &count);
    
    for (int i = 0; i < count; i ++) {
        
        Method method = methods[i];
        
        SEL methodName = method_getName(method);
        
        NSString *str = [NSString stringWithCString:sel_getName(methodName) encoding:NSUTF8StringEncoding];
        
//        int arguments = method_getNumberOfArguments(method);
        
        [mArray addObject:str];
    }
    
    free(methods);
    
    return [mArray copy];

    
}


- (NSArray *)getAllMethodsForSwizzling{
    
    NSMutableArray *mArray = [NSMutableArray array];

    return [mArray copy];
}


#pragma mark private

- (void)swizzing{

    Method origin = class_getInstanceMethod([self class], @selector(getAllMethodsForSwizzling));
    
    Method custom = class_getInstanceMethod([self class], @selector(getAllMethods));
    
    method_exchangeImplementations(origin, custom);
}

- (void)association{
    
    static char overviewKey;
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"1",@"2",@"3",nil];
    
    NSString *overview =[[NSString alloc] initWithFormat:@"%@",@"first three numbers"];
    
    objc_setAssociatedObject(array, &overviewKey, overview, OBJC_ASSOCIATION_RETAIN);
    
    objc_setAssociatedObject(array, &overviewKey, nil, OBJC_ASSOCIATION_ASSIGN);
    
    NSString *associateStr = objc_getAssociatedObject(array, &overviewKey);
    
    NSLog(@"associalteStr = %@",associateStr);
    
}

@end
