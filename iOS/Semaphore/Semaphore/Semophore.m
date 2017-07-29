//
//  Semophore.m
//  Semaphore
//
//  Created by autel on 17/7/27.
//  Copyright © 2017年 zhongjiasheng. All rights reserved.
//

#import "Semophore.h"

@implementation Semophore

- (void)semaphore{
    
    dispatch_semaphore_t sigal = dispatch_semaphore_create(1);
    
    dispatch_group_t group = dispatch_group_create();
    
    NSLog(@"begin");
    
    for (int i = 0; i < 100 ; i ++) {
        
        dispatch_group_async(group,dispatch_get_global_queue(0, 0), ^{
            
            dispatch_semaphore_wait(sigal, DISPATCH_TIME_FOREVER);
            
            NSLog(@".........%d",i);
            
            sleep(1);
            
            dispatch_semaphore_signal(sigal);
        });
        
    }
    
    
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        //
        NSLog(@"end");
    });
    
}


- (void)netModal{
    
    int num = 5;
    dispatch_semaphore_t sigal = dispatch_semaphore_create(0);

    for (int i = 0; i < num; i ++) {
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            //
            
            NSLog(@"------- %d",i);
            sleep(3);

            dispatch_semaphore_signal(sigal);
            
        });
    }
    
    for (int i = 0; i < num; i ++) {
    dispatch_semaphore_wait(sigal, DISPATCH_TIME_FOREVER);
    }
    
    
    NSLog(@"网络请求2");
    
}

@end
