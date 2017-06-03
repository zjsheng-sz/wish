//
//  GWWish+runtime.m
//  Runtime
//
//  Created by autel on 17/6/3.
//  Copyright © 2017年 zhongjiasheng. All rights reserved.
//

#import "GWWish+runtime.h"
#import <objc/runtime.h>

@implementation GWWish (runtime)

- (void)test{

    static char overviewKey;
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"1",@"2",@"3",nil];
    
    NSString *overview =[[NSString alloc] initWithFormat:@"%@",@"first three numbers"];

    objc_setAssociatedObject(array, &overviewKey, overview, OBJC_ASSOCIATION_RETAIN);
 
    NSLog(@"array:%@",array);
}

@end
