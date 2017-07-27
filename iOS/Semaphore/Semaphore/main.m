//
//  main.m
//  Semaphore
//
//  Created by autel on 17/7/4.
//  Copyright © 2017年 zhongjiasheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Semophore.h"

void semaphore();

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSLog(@"hello semaphore");
        
        Semophore *semophoree = [[Semophore alloc] init];
        
        [semophoree semaphore];
    }
    return 0;
}





