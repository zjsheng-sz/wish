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
    
//    dispatch_semaphore_t sigal = dispatch_semaphore_create(10);
    //
//    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC);
    
    dispatch_group_t group = dispatch_group_create();
    
    NSLog(@"begin");
    
    for (int i = 0; i < 100 ; i ++) {
        
        dispatch_group_async(group,dispatch_get_global_queue(0, 0), ^{
            
            
//            dispatch_semaphore_wait(sigal, time);
            
            NSLog(@".........%d",i);
            
//            dispatch_semaphore_signal(sigal);
        });
        
    }
    
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        //
        NSLog(@"end");
    });
    
}

@end
